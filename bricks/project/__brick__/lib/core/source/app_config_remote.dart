// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/app/data/model/app_remote_config/app_remote_config.dart';
import 'package:{{projectName.snakeCase()}}/app/data/model/app_remote_config/app_version.dart';
import 'package:{{projectName.snakeCase()}}/app/data/model/app_remote_config/force_update.dart';

abstract class AppConfigRemote {
  AppRemoteConfig get config;
}

@Environment(Environment.prod)
@LazySingleton(as: AppConfigRemote)
class AppRemoteConfigImpl implements AppConfigRemote {
  final FirebaseRemoteConfig _config;
  AppRemoteConfigImpl(this._config);

  @override
  AppRemoteConfig get config {
    return AppRemoteConfig.fromJson(
        jsonDecode(_config.getValue("prod_config").asString()));
  }
}

@Environment(Environment.dev)
@LazySingleton(as: AppConfigRemote)
class DevAppRemoteConfigImpl implements AppConfigRemote {
  final FirebaseRemoteConfig _config;
  DevAppRemoteConfigImpl(this._config);

  @override
  AppRemoteConfig get config {
    return AppRemoteConfig.fromJson(
        jsonDecode(_config.getValue("dev_config").asString()));
  }
}

@Environment(Environment.test)
@LazySingleton(as: AppConfigRemote)
class TestAppRemoteConfigImpl implements AppConfigRemote {
  @override
  AppRemoteConfig get config => AppRemoteConfig(
        baseUrl: "",
        name: "",
        certificateFingerprintSha256:
            "",
        checkRootOrJailbreak: false,
        forceUpdate: ForceUpdate(
          android: AppVersion(
              minVersionName: "1.0.0",
              minVersionCode: "1",
              enable: true,
              force: false),
          ios: AppVersion(
              minVersionName: "1.0.0",
              minVersionCode: "1",
              enable: true,
              force: false),
        ),
      );
}
