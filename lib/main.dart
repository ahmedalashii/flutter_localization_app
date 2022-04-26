// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_app/prefs/app_settings_prefs.dart';
import 'package:provider/provider.dart';
import 'provider/language_change_notifier.dart';
import 'screens/launch_screen.dart';
import 'screens/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettingsPreferences().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // if more than one provider
      providers: [
        // Provider<Something>(create: (_) => Something()),
        ChangeNotifierProvider<LanguageChangeNotifier>(
            create: (_) => LanguageChangeNotifier()),
      ],
      child: MainMaterialApp(),
    );
  }
}

class MainMaterialApp extends StatelessWidget {
  const MainMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // فصلنا الماتيريال آب لانو لو حطيناها كتشايلد مباشرةً للملتي بروفايدر هيطلعلي خطأ انو انا مستخدم البروفايدر في نفس الكونتكست ف لازم نفصل الكونتكست
    return MaterialApp(
      // we can't put ChangeNotifierProvider here and dealing with MaterialApp context at the same time. >> بنقدرش نعرّف البروفايدر على ويدجيت ونتعامل مع نفس الكونتست تاعها
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ], // or simply by using this line below :
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: <Locale>[
      //   // if there are multiple locales here and we don't specify a locale in the local property below >> then the default one will automatically be the mobile's language (locale).
      //   Locale("en"),
      //   Locale("ar"),
      // ], // or simply by using this line below :
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<LanguageChangeNotifier>(context).languageCode),
      initialRoute: "/launch_screen",
      routes: {
        "/launch_screen": (context) => LaunchScreen(),
        "/login_screen": (context) => LoginScreen(),
      },
    );
  }
}
