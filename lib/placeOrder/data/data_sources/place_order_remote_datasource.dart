import 'dart:convert';

import 'package:book_store_app/core/local_auth_storage.dart';
import 'package:http/http.dart' as http;

import '../../../core/constant_value.dart';
import '../../../core/exceptions.dart';

abstract class PlaceOrderRemoteDataSource{
  Future<String> postPayment(int amount);
}

class PlaceOrderRemoteDataSourceImpl extends PlaceOrderRemoteDataSource{
  final http.Client client;

  PlaceOrderRemoteDataSourceImpl(this.client);

  @override
  Future<String> postPayment(int amount) async{
    final email = await LocalAuthStorage().read("email");
    final ref =await LocalAuthStorage().read("ref");
    final body = {"AMOUNT": amount, "EMAIL": email,"REFERENCE":"pgtest_123456789"};
    final response = await client.post(
        Uri.parse("https://www.myencore.co.za/bookshop/appginilte/api/services/stores/start.php"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json['processPaymentURL']);
      return json['processPaymentURL'];
    } else {
      throw ServerException(response.reasonPhrase.toString());
    }
  }

}