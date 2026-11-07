import 'package:flutter/foundation.dart';

/// Utilitas untuk logging terstruktur.
///
/// Hanya mencetak log saat aplikasi berjalan di mode debug (kDebugMode).
/// Gunakan class ini alih-alih `print` biasa untuk memudahkan debugging
/// dan mencegah kebocoran informasi di versi rilis.
class Logger {
  /// Mencetak log dengan level DEBUG.
  static void debug(String message, [dynamic error]) {
    _log('DEBUG', message, error);
  }

  /// Mencetak log dengan level INFO.
  static void info(String message) {
    _log('INFO', message);
  }

  /// Mencetak log dengan level WARNING.
  static void warning(String message, [dynamic error]) {
    _log('WARNING', message, error);
  }

  /// Mencetak log dengan level ERROR.
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _log('ERROR', message, error, stackTrace);
  }

  /// Method internal untuk memformat dan mencetak log.
  /// Memastikan log hanya keluar jika `kDebugMode` aktif.
  static void _log(String level, String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      final time = DateTime.now().toIso8601String();
      print('[$time] [$level] $message');
      if (error != null) {
        print('  Error: $error');
      }
      if (stackTrace != null) {
        print('  StackTrace: $stackTrace');
      }
    }
  }
}
