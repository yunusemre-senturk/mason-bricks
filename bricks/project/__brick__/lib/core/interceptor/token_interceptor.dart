// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:{{projectName.snakeCase()}}/app/page/app/app_vm.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/core/util/object_extention.dart';
import 'package:{{projectName.snakeCase()}}/core/di/locator.dart';
import 'package:{{projectName.snakeCase()}}/core/source/local_data_source.dart';
import 'package:{{projectName.snakeCase()}}/route.routes.dart';

//https://github.com/flutterchina/dio
class TokenInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var localDataSource = getIt<LocalDataSource>();
    if (localDataSource.user != null) {
      options.headers['Authorization'] =
          "Bearer ${localDataSource.user!.token}";
      //localDataSource.clear();
      // getIt<AppRoute>().mainNavigatorKey.currentContext?.let((it) {
      //   Navigator.pushNamedAndRemoveUntil(it, "splash", (route) => false);
      // });
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    var localDataSource = getIt<LocalDataSource>();
    if (err.response?.statusCode == 401) {
      localDataSource.clear();
      getIt<AppViewModel>().mainNavigatorKey.currentContext?.let((it) {
        Navigator.pushNamedAndRemoveUntil(
            it, RouteMaps.splashRoute, (route) => false);
      });
      handler.reject(
          DioException(error: "Logout", requestOptions: err.requestOptions));
    }
    super.onError(err, handler);
  }
}
