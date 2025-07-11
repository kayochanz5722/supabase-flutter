import 'package:supabase_flutter/src/version.dart';

class Constants {
  static const Map<String, String> defaultHeaders = {
    'X-Client-Info': 'supabase-flutter/$version',
    'User-Agent': 'Flutter/3.8.1 (Windows NT 10.0; Win64; x64)',
  };
}
