// Package imports:
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/core/util/logger.dart';

@LazySingleton()
class GeoManager {
  Position? position;
  Future<Position> getCurrentPosition() async {
    if (position != null) {
      return position!;
    }
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Log.i("Konum servisleri aktif değil.");
      return Future.error('Konum servisleri aktif değil.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Log.i("Konum izinleri reddedildi.");
        return Future.error('Konum izinleri reddedildi.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Log.i(
          "Konum izinleri kalıcı olarak reddedildi, izin isteği gönderemiyoruz.");
      return Future.error(
          'Konum izinleri kalıcı olarak reddedildi, izin isteği gönderemiyoruz.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
