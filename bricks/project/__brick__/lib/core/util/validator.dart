class Validator {
  static String? phone(String? str) {
    if (str == null || str.isEmpty) {
      return "• Lütfen telefon numarası giriniz.";
    } else {
      return RegExp(r"^5(0[5-7]|[3-5]\d) \d{3} \d{2} \d{2}$").hasMatch(str)
          ? null
          : "• Lütfen geçerli bir telefon numarası giriniz.";
    }
  }

  static String? email(String? str) {
    if (str == null || str.isEmpty) {
      return "• Lütfen email giriniz.";
    } else if (str.isNotEmpty) {
      bool rex = RegExp(
              r"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
              "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
              "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
              "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
              "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
              "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
              "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
          .hasMatch(str);
      return rex ? null : "• Lütfen geçerli email giriniz.";
    }
    return null;
  }

  static String? password(String? str) {
    var msg =
        "• Şifreniz en az 8 karakterden oluşmalı. Büyük harf, küçük harf, rakam ve sembol içermelidir.";
    if (str == null || str.isEmpty) {
      return msg;
    }
    // if (str.isNotEmpty) {
    //   bool rex = RegExp(
    //           r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!?.'^+%&/()=_/*-+,;:<>$#{}])[a-zA-Z0-9!?.'^+%&/()=_/*-+,;:<>$#{}]{8,}$")
    //       .hasMatch(str);

    //   return rex ? null : msg;
    // }
    return null;
  }

  static String? tc(String? str) {
    if (str == null || str.isEmpty) {
      return "• Lütfen TC Kimlik No giriniz.";
    } else if (!RegExp(r"^[1-9]{1}[0-9]{9}[02468]{1}$").hasMatch(str)) {
      return "• Lütfen geçerli bir TC Kimlik No giriniz.";
    }
    return null;
  }

  static String? passwordCompare(String? pass1, String? pass2) {
    if (pass1 != pass2) {
      return "• Girdiğiniz şifreler uyumlu değil, kontrol ediniz.";
    }
    return null;
  }

  static String? notNullOrEmpty(String? str) {
    if (str == null || str.isEmpty) {
      return "• Boş bırakılamaz";
    }
    return null;
  }


  static String? description(String? str) {
    if (str == null || str.isEmpty) {
      return "• Boş bırakılamaz";
    }
    if (str.replaceAll(" ", "").isEmpty) {
      return "• Geçerli karakter giriniz.";
    }
    if (str.length > 180) {
      return "• En fazla 180 karaktere izin verilir.";
    }
    return null;
  }
  //Hem 216 gibi başlayan numaraları hem de 533 gibi başlayan numaraları kabul ediyor
  static String? storePhone(String? str) {
    if (str == null || str.isEmpty) {
      return "• Lütfen telefon numarası giriniz.";
    } else {
      return RegExp(
                  r'^(0|(\+|00)90\s?)?(50[5-7]|53[1-4]|54[1-9]|55[0-9]|56[1-4]|57[0-9]|58[2-4]|59[0-9]|[2-9]\d{2})[0-9]\d{6}$')
              .hasMatch(str)
          ? null
          : "• Lütfen geçerli bir numara giriniz.";
    }
  }


  
}
