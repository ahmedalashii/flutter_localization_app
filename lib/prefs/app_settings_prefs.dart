import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsPreferences {
  static final AppSettingsPreferences _instance =
      AppSettingsPreferences._internal();

  late SharedPreferences _sharedPreferences;

  AppSettingsPreferences._internal();

  factory AppSettingsPreferences() {
    return _instance;
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveLanguage({required String languageCode}) async {
    await _sharedPreferences.setString("lang_code", languageCode);
  }

  String get languageCode => _sharedPreferences.getString("lang_code") ?? "en"; // if it's null >> en by default
}
