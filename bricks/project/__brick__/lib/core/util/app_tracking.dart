import 'package:app_tracking_transparency/app_tracking_transparency.dart';

Future<void> appTracking() {
  return AppTrackingTransparency.requestTrackingAuthorization();
}
