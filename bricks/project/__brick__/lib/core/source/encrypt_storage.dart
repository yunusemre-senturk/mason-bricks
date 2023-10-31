// Package imports:
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:{{projectName.snakeCase()}}/core/util/encrypt/aes_encrypt.dart';

///
/// GetStorage ile kaydedilen verileri ve keylerini şifreler
/// double,int,bool,num, string tiplerini destekler
///
abstract class EncryptStorage {
  T? read<T>(String key);
  Future<void> write(String key, dynamic value);
}

@LazySingleton(as: EncryptStorage)
class EncryptStorageImpl implements EncryptStorage {
  EncryptStorageImpl(this._storage);
  final GetStorage _storage;
  @override
  T? read<T>(String key) {
    String? readData = _storage.read(AesEncrypt.encrypt(key));
    if (readData != null) {
      String data = AesEncrypt.decrypt(readData);
      switch (T) {
        case int:
          return int.parse(data) as T;
        case double:
          return double.parse(data) as T;
        case num:
          return num.parse(data) as T;
        case bool:
          return (data == 'true') as T;
        case String:
          return data as T;
        default:
          throw Exception('Not yet implemented $key');
      }
    }

    return null;
  }

  @override
  Future<void> write(String key, dynamic value) => value == null
      ? _storage.remove(AesEncrypt.encrypt(key))
      : _storage.write(
          AesEncrypt.encrypt(key), AesEncrypt.encrypt(value.toString()));
}
