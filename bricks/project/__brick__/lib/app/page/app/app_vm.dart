// Dart imports:
import 'dart:io';

// Package imports:
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/app/data/model/app_remote_config/app_version.dart';
import 'package:{{projectName.snakeCase()}}/core/base/base_view_model.dart';
import 'package:{{projectName.snakeCase()}}/core/source/app_config_remote.dart';
import 'package:{{projectName.snakeCase()}}/core/source/local_data_source.dart';
import 'package:{{projectName.snakeCase()}}/core/util/siren.dart';

@lazySingleton
class AppViewModel extends BaseViewModel {
  final AppConfigRemote _appConfig;
  final LocalDataSource _localDataSource;
  final PackageInfo _packageInfo;
  AppViewModel(this._appConfig, this._localDataSource, this._packageInfo) {
    var siren = Siren();
    siren.setMajorUpdateAlertType(SirenType.force);
    AppVersion? version;
    if (Platform.isIOS) {
      version = _appConfig.config.forceUpdate.ios;
    } else if (Platform.isAndroid) {
      version = _appConfig.config.forceUpdate.android;
    }
    if (version != null) {
      siren.checkVersionName(
          minVersion: version.minVersionName,
          currentVersion: _packageInfo.version,
          onDetectNewVersion: (version, type) {
            _sirenType = type;
            notifyListeners();
          },
          forceUpdateEnabled: version.force,
          versionCheckEnabled: version.enable);
    }
  }

  final GlobalKey<NavigatorState> _mainNavigatorKey =
      GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get mainNavigatorKey => _mainNavigatorKey;

  String get appName => _appConfig.config.name;
  SirenType _sirenType = SirenType.none;
  SirenType get sirenType => _sirenType;
  setSirenType(SirenType type) {
    _sirenType = type;
    notifyListeners();
  }

  bool get isDark => _localDataSource.isDark;
  void switchTheme() {
    _localDataSource.setIsDark(!isDark);
    notifyListeners();
  }
}
