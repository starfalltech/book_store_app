import 'dart:convert';

import 'package:book_store_app/authentication/domain/entities/user_entity.dart';
import 'package:book_store_app/core/constant_value.dart';
import 'package:book_store_app/core/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSources {
  Future<String> login(String email, String password);

  Future<String> signWithGoogle();

  Future<String> verify(String email, String code);

  Future<String> register(String name, String email, String password,
      String cell);
}

class AuthenticationRemoteDataSourcesImpl
    extends AuthenticationRemoteDataSources {
  final http.Client client;

  AuthenticationRemoteDataSourcesImpl(this.client);

  @override
  Future<String> login(String email, String password) async {
    final body = {"password": password, "email": email};
    final response = await client.post(
        Uri.parse("${ConstantValue.apiUrl}users/login"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      final res = userEntityFromJson(response.body);
      if (res.response.error != '1') {
        final token = jsonDecode(response.body);
        print(token["response"]["Token"]);
        return token["response"]["Token"];
      } else {
        throw ServerException(res.response.message);
      }
    } else {
      throw ServerException(response.reasonPhrase.toString());
    }
  }

  @override
  Future<String> register(String name, String email, String password,
      String cell) async {
    final body = {
      "password": password,
      "email": email,
      "cell": cell,
      "name": name
    };
    final response = await client.post(
        Uri.parse("${ConstantValue.apiUrl}users/register"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      final res = userEntityFromJson(response.body);
      if (res.response.error != '1') {
        final token = jsonDecode(response.body);
        return token["response"]["token"];
      } else {
        throw ServerException(res.response.message);
      }
    } else {
      throw ServerException(response.reasonPhrase.toString());
    }
  }

  @override
  Future<String> verify(String email, String code) async {
    final body = {"code": code, "email": email};
    final response = await client.post(
        Uri.parse("${ConstantValue.apiUrl}users/verify"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      final res = userEntityFromJson(response.body);
      if (res.response.error != '1') {
        final token = jsonDecode(response.body);
        return token["response"]["token"];
      } else {
        throw ServerException(res.response.message);
      }
    } else {
      throw ServerException(response.reasonPhrase.toString());
    }
  }

  @override
  Future<String> signWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser?.email != null) {
      FirebaseAuth auth = FirebaseAuth.instance;
      List<String> signInMethods =
      await auth.fetchSignInMethodsForEmail(googleUser!.email);
      if (signInMethods.isEmpty) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userfirebase =
        await FirebaseAuth.instance.signInWithCredential(credential);
        return await register(
            userfirebase.user?.displayName ??
                googleUser!
                    .email
                    .split("@")
                    .first,
            googleUser.email,
            userfirebase.credential?.accessToken ?? '',
            userfirebase.user?.phoneNumber ?? "0444");
      } else {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userfirebase =
        await FirebaseAuth.instance.signInWithCredential(credential);
        return await login(
          googleUser.email,
          userfirebase.credential?.accessToken ?? '',
        );
      }
    } else {
      throw "UnAuthenticated";
    }
  }
}