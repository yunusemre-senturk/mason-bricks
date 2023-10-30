// Flutter imports:
import 'package:flutter/foundation.dart';

///
/// camelCase: snake_case
/// loginTextFieldEmail : login_text_field_email
///
class IntegrationTestKeys {
  static const String loginTextFieldUserName = "login_text_field_user_name";
  static const String loginTextFieldPassword = "login_text_field_password";
  static const String loginButtonGirisYap = "login_button_giris_yap";
  static const String loginButtonSifremiUnuttum =
      "login_button_sifremi_unuttum";
  static const String loginButtonKayitOl = "login_button_kayit_ol";
  static const String loginSwitchAltIsVeren = "login_switch_alt_is_veren";
  static const String otpPinViewSifre = "otp_pin_view_sifre";
  static const String otpButtonTekrarGonder = "otp_button_tekrar_gonder";
  static const String otpButtonDogrula = "otp_button_dogrula";
}

Key? integrationTestKey(String key) {
  return kDebugMode ? Key(key) : null;
}
