import 'package:book_store_app/authentication/data/data_sources/authentication_remote_datasources.dart';
import 'package:book_store_app/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:book_store_app/authentication/domain/repositories/authentication_repository.dart';
import 'package:book_store_app/core/app_theme_data.dart';
import 'package:book_store_app/widget/loading_spin_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import 'bloc_observer.dart';
import 'core/network_info.dart';
import 'onBoarding/pages/splash_page.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (_) => Connectivity(),
          ),
          RepositoryProvider<NetworkInfo>(
            create: (context) => NetworkInfoImpl(
              RepositoryProvider.of<Connectivity>(context),
            ),
          ),
          RepositoryProvider<AuthenticationRemoteDataSources>(
            create: (context) =>
                AuthenticationRemoteDataSourcesImpl(http.Client()),
          ),
          RepositoryProvider<AuthenticationRepository>(
              create: (context) => AuthenticationRepositoryImpl(
                    RepositoryProvider.of<AuthenticationRemoteDataSources>(
                        context),
                    RepositoryProvider.of<NetworkInfo>(context),
                  )),
        ],
        child: GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: const LoadingSpinWidget(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemeData.getTheme(context),
            home: const SplashPage(),
          ),
        ),
      );
    });
  }
}
