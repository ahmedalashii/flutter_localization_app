// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:localization_app/prefs/app_settings_prefs.dart';

class LanguageChangeNotifier extends ChangeNotifier{
  String languageCode = AppSettingsPreferences().languageCode;

  void changeLanguage({required String languageCode}){
    this.languageCode = languageCode;
    AppSettingsPreferences().saveLanguage(languageCode: this.languageCode);
    notifyListeners();
  }
}