/// Kumpulan fungsi validasi dan sanitasi input.
///
/// Class ini menyediakan method statis untuk memvalidasi input
/// pengguna dan membersihkan karakter berbahaya.
class Validators {
  /// Memvalidasi format email.
  ///
  /// Mengembalikan `true` jika [email] memiliki format yang valid.
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  /// Memvalidasi bahwa [value] tidak kosong.
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /// Memvalidasi panjang [value] antara [min] dan [max].
  static bool hasValidLength(String value, {int min = 1, int max = 100}) {
    final length = value.trim().length;
    return length >= min && length <= max;
  }

  /// Memvalidasi nomor telepon (hanya angka, 10-13 digit).
  static bool isValidPhone(String phone) {
    final regex = RegExp(r'^\d{10,13}$');
    return regex.hasMatch(phone);
  }

  /// Memvalidasi format URL (harus dimulai dengan http:// atau https://).
  static bool isValidUrl(String url) {
    final regex = RegExp(r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$');
    return regex.hasMatch(url);
  }

  /// Memvalidasi password (min 8 karakter, ada huruf kapital, angka, dan simbol).
  static bool isValidPassword(String password) {
    final regex = RegExp(
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    return regex.hasMatch(password);
  }

  /// Membersihkan input dari karakter berbahaya.
  /// Mengganti karakter `<`, `>`, `"`, dan `'` dengan HTML entities
  /// untuk mencegah XSS.
  static String sanitize(String input) {
    return input
        .replaceAll('<', '<')
        .replaceAll('>', '>')
        .replaceAll('"', '"')
        .replaceAll("'", "'")
        .trim();
  }
  /// Memvalidasi dan membersihkan input teks.
  ///
  /// Mengembalikan pesan error jika tidak valid, atau `null` jika valid.
  static String? validateText(
      String? value, {
        String fieldName = 'Field',
        int minLength = 1,
        int maxLength = 100,
      }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName tidak boleh kosong';
    }
    if (!hasValidLength(value, min: minLength, max: maxLength)) {
      return '$fieldName harus antara $minLength-$maxLength karakter';
    }
    return null;
  }
  /// Memvalidasi dan membersihkan email.
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!isValidEmail(value.trim())) {
      return 'Format email tidak valid';
    }
    return null;
  }

  /// Memvalidasi input telepon.
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    if (!isValidPhone(value.trim())) {
      return 'Nomor telepon tidak valid (hanya angka, 10-13 digit)';
    }
    return null;
  }

  /// Memvalidasi input URL.
  static String? validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'URL tidak boleh kosong';
    }
    if (!isValidUrl(value.trim())) {
      return 'Format URL tidak valid (harus diawali http:// atau https://)';
    }
    return null;
  }

  /// Memvalidasi input Password.
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (!isValidPassword(value)) {
      return 'Password minimal 8 karakter, mengandung huruf kapital, angka, dan simbol (!@#\$&*~)';
    }
    return null;
  }
}
