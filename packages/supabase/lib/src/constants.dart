import 'package:supabase/src/version.dart';
import 'dart:io' show Platform;

const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');

class Constants {
  static String? get platform {
    if (kIsWeb) return null;
    // Возвращаем безопасное значение для Windows без кириллицы
    final os = Platform.operatingSystem;
    if (os.toLowerCase().contains('windows')) {
      return 'Windows NT 10.0';
    }
    return os;
  }

  static String? get platformVersion {
    if (kIsWeb) return null;
    // Возвращаем безопасную версию для Windows
    final version = Platform.operatingSystemVersion;
    if (Platform.operatingSystem.toLowerCase().contains('windows')) {
      return '10.0.22631';
    }
    return version;
  }

  static final Map<String, String> defaultHeaders = {
    'X-Client-Info': 'supabase-dart/$version',
    'User-Agent': 'Flutter/3.8.1 (Windows NT 10.0; Win64; x64)',
    if (platform != null)
      'X-Supabase-Client-Platform':
          Uri.encodeFull(platform!).replaceAll("%20", " "),
    if (platformVersion != null)
      'X-Supabase-Client-Platform-Version':
          Uri.encodeFull(platformVersion!).replaceAll("%20", " "),
  };
}
