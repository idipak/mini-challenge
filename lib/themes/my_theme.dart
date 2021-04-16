import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }

  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.deepOrangeAccent,
            textTheme: TextTheme(
                headline6: GoogleFonts.dancingScript().copyWith(fontSize: 25)),
          ),
          brightness: Brightness.light,
          textTheme: TextTheme(
            headline3: GoogleFonts.dancingScript(),
            subtitle1: GoogleFonts.lato(),
            bodyText1: GoogleFonts.lato(),
          ),
        );
      case ThemeType.Dark:
        return ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
                headline6: GoogleFonts.dancingScript().copyWith(fontSize: 25)),
          ),
          textTheme: TextTheme(
            headline3: GoogleFonts.dancingScript(),
            subtitle1: GoogleFonts.lato(),
            bodyText1: GoogleFonts.lato(),
          ),
        );
      case ThemeType.Other:
        return ThemeData(
          primaryColor: Colors.green,
          canvasColor: Colors.lightGreenAccent,
          accentColor: Colors.white,
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
                headline6: GoogleFonts.dancingScript().copyWith(
              fontSize: 25,
            )),
          ),
          brightness: Brightness.light,
          textTheme: TextTheme(
            headline3: GoogleFonts.dancingScript(),
            subtitle1: GoogleFonts.lato(),
            bodyText1: GoogleFonts.lato(),
          ),
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
