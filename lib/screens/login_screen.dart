// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_app/prefs/app_settings_prefs.dart';
import 'package:localization_app/provider/language_change_notifier.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _State();
}

class _State extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login.toUpperCase()),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Locale currentLocale = Localizations.localeOf(context); // this is for getting the current locale
            // String newLocale = (currentLocale.languageCode == "ar") ? "en": "ar";


            String newLocale = (AppSettingsPreferences().languageCode == "en") ? "ar": "en"; // or the line below
            // String newLocale = (Provider.of<LanguageChangeNotifier>(context, listen: false).languageCode == "en") ? "ar": "en";
            // يا بسمع يا بقرأ , يا بحدّث عالقيمة يا بسمع :) التنين بزبطوش ف لازم ليستين فولس
            Provider.of<LanguageChangeNotifier>(context, listen: false).changeLanguage(languageCode: newLocale); // don't you ever talk with the variable
          },
          child: Icon(Icons.language)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.welcome_back,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.login_hint,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.email,
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.password,
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.login_button),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
