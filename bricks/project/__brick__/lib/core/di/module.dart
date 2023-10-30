// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/app/data/service/api_service.dart';
import 'package:{{projectName.snakeCase()}}/core/di/locator.dart';
import 'package:{{projectName.snakeCase()}}/core/interceptor/error_interceptor.dart';
import 'package:{{projectName.snakeCase()}}/core/interceptor/log_interceptor.dart';
import 'package:{{projectName.snakeCase()}}/core/interceptor/token_interceptor.dart';
import 'package:{{projectName.snakeCase()}}/core/source/app_config_remote.dart';
import 'package:{{projectName.snakeCase()}}/store_opening_system/employee/data/service/store_employee_service.dart';
import 'package:{{projectName.snakeCase()}}/store_opening_system/manager/data/service/store_api_service.dart';

@module
abstract class AppModule {
  @Environment(Environment.dev)
  @Environment(Environment.prod)
  @Environment(Environment.test)
  @lazySingleton
  Dio get injectRetrofitAPI {
    Dio dio = Dio(
      BaseOptions(baseUrl: getIt<AppConfigRemote>().config.baseUrl, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      }
          // connectTimeout: 10000,
          // receiveTimeout: 10000,
          // sendTimeout: 10000,
          ),
    );
    // dio.interceptors.add(CertificatePinningInterceptor2(
    //     allowedSHAFingerprints: [
    //       getIt<AppConfig>().certificateFingerprintSHA256
    //     ]));
    dio.interceptors.add(TokenInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(LoggerInterceptor());
      // dio.interceptors.add(PrettyDioLogger(
      //   requestHeader: true,
      //   requestBody: true,
      //   responseHeader: true,
      // ));
    }

    dio.interceptors.add(ErrorInterceptor());

    return dio;
  }

  @Environment(Environment.dev)
  @Environment(Environment.prod)
  @preResolve
  Future<GetStorage> get initializeGetStorage async {
    // init future olarak tanımladığı için önce init edip sonra objeyi çağrıyoruz.
    var storageName = "gs1";
    await GetStorage.init(storageName);
    return GetStorage(storageName);
  }

  @lazySingleton
  ApiService get injectApiService => ApiService(injectRetrofitAPI);
  @lazySingleton
  ApiServiceStoreOpeningSystem get injectApiStoreService =>
      ApiServiceStoreOpeningSystem(injectRetrofitAPI);
  @lazySingleton
  ApiServiceStoreOpeningSystemEmployee get injectApiStoreServiceEmployee =>
      ApiServiceStoreOpeningSystemEmployee(injectRetrofitAPI);

  @Environment(Environment.prod)
  @Environment(Environment.dev)
  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  @Environment(Environment.dev)
  @Environment(Environment.prod)
  @preResolve
  Future<FirebaseApp> get initializeApp {
    WidgetsFlutterBinding.ensureInitialized();
    return Firebase.initializeApp();
  }

  @Environment(Environment.dev)
  @Environment(Environment.prod)
  @preResolve
  Future<FirebaseRemoteConfig> get remoteConfigService async {
    var conf = FirebaseRemoteConfig.instance;
    await conf.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 10),
    ));
    await conf.fetchAndActivate();
    return conf;
  }

  DeviceInfoPlugin get deviceInfo => DeviceInfoPlugin();

  NetworkInfo get networkInfo => NetworkInfo();
}
