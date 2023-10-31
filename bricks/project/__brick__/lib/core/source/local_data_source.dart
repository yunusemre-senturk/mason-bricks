// Dart imports:
import 'dart:convert';

// Flutter imports:

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/app/data/model/auth/user/user.dart';
import 'package:{{projectName.snakeCase()}}/core/source/encrypt_storage.dart';

abstract class LocalDataSource {
  String? get otpToken;
  Future setOtpToken(String? otp);

  User? get user;
  Future setUser(User? user);

  bool get isKoctasStaff;
  String? get employeeType;
  Future setIsKoctasStaff(bool flag);

  String? get deviceId;
  Future setDeviceId(String? deviceId);

  bool get isDark;
  Future setIsDark(bool flag);
  Future<void> clear();

  String? get pushNotification;
  Future setPushNotification(String token);

  String? get email;
  Future setEmail(String? email);
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final EncryptStorage _getStorage;
  LocalDataSourceImpl(this._getStorage);

  @override
  Future<void> clear() async {
    setUser(null);
    return;
  }

  @override
  bool get isDark => _getStorage.read<bool>("isDark") == true;

  @override
  Future setIsDark(bool flag) {
    return _getStorage.write("isDark", flag);
  }

  @override
  String? get otpToken => _getStorage.read("otpToken");

  @override
  Future setOtpToken(String? otp) {
    return _getStorage.write("otpToken", otp);
  }

  @override
  Future setUser(User? user) {
    setOtpToken(null);
    if (user != null) {
      return _getStorage.write("user", jsonEncode(user.toJson()));
    }
    return _getStorage.write("user", null);
  }

  @override
  User? get user {
    String? readData = _getStorage.read("user");
    if (readData != null) {
      Map<String, dynamic> json = jsonDecode(readData);
      return User.fromJson(json);
    }
    return null;
  }

  @override
  String? get deviceId => _getStorage.read("deviceId");

  @override
  Future setDeviceId(String? deviceId) {
    return _getStorage.write("deviceId", deviceId);
  }

  @override
  bool get isKoctasStaff => _getStorage.read<bool>("isKoctasStaff") ?? true;

  @override
  Future setIsKoctasStaff(bool flag) {
    return _getStorage.write("isKoctasStaff", flag);
  }

  @override
  String? get employeeType => isKoctasStaff ? "4" : "9";

  @override
  String? get pushNotification => _getStorage.read("pushNotification");

  @override
  Future setPushNotification(String token) {
    return _getStorage.write("pushNotification", token);
  }

  @override
  String? get email => _getStorage.read("email");

  @override
  Future setEmail(String? email) {
    return _getStorage.write("email", email);
  }
}

@Environment(Environment.test)
@LazySingleton(as: LocalDataSource)
class TestLocalDataSourceImpl implements LocalDataSource {
  @override
  Future<void> clear() async {
    return;
  }

  bool _isDark = false;
  @override
  bool get isDark => _isDark;

  @override
  Future setIsDark(bool flag) async {
    _isDark = flag;
  }

  String? _otp;
  @override
  String? get otpToken => _otp;

  @override
  Future setOtpToken(String? otp) async {
    _otp = otp;
  }

  User? _user;
  @override
  Future setUser(User? user) async {
    _user = user;
  }

  @override
  User? get user => _user;

  String? _deviceId = "1";
  @override
  String? get deviceId => _deviceId;

  @override
  Future setDeviceId(String? deviceId) async {
    _deviceId = deviceId;
    return;
  }

  bool _isKoctasStaff = true;
  @override
  bool get isKoctasStaff => _isKoctasStaff;

  @override
  Future setIsKoctasStaff(bool flag) async {
    _isKoctasStaff = flag;
    return;
  }

  @override
  String? get employeeType => isKoctasStaff ? "4" : "9";

  String? _pushNotification = "";
  @override
  String? get pushNotification => _pushNotification;

  @override
  Future setPushNotification(String token) async {
    _pushNotification = pushNotification;
    return;
  }

  String? _email;
  @override
  String? get email => _email;

  @override
  Future setEmail(String? email) async {
    _email = email;
    return;
  }
}
