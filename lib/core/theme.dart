import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static const borderRadius = 6.0;
  static const primaryColor = Color(0xff81bc4b);
  static const primaryColorLight = Color(0xFF9ECC73);
  static final accentColor = Color(0xffF47621);
  static const accentColorLight = Color(0xFFEC8A49);
  static const errorColor = Colors.red;

  static final ColorScheme lightColorScheme = ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: accentColor,
      error: errorColor,
      background: Colors.grey.shade100,
      surface: Colors.white);

  static final ColorScheme darkColorScheme = ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: accentColor,
    error: errorColor,
  );

  static TextTheme globalTextTheme(ThemeData theme) {
    var txtTheme = theme.textTheme;

    return txtTheme.apply(fontFamily: "Inter");
  }

  static final ThemeData lightTheme = ThemeData.from(
          colorScheme: lightColorScheme,
          textTheme: globalTextTheme(ThemeData.light()))
      .copyWith(
          splashColor: primaryColor.withOpacity(0.2),
          colorScheme: lightColorScheme,
          primaryColor: primaryColor,
          toggleableActiveColor: primaryColor,
          accentColor: accentColor,
          textTheme: globalTextTheme(ThemeData.light()),
          inputDecorationTheme: InputDecorationTheme()
              .copyWith(isDense: true, border: OutlineInputBorder()),
          appBarTheme: ThemeData.light().appBarTheme.copyWith(
              textTheme: globalTextTheme(ThemeData.light()),
              color: Colors.white,
              elevation: 1,
              iconTheme: IconThemeData(color: Colors.grey.shade700),
              brightness: Brightness.light),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)))));

  static final ThemeData darkTheme = ThemeData.from(
          colorScheme: darkColorScheme,
          textTheme: globalTextTheme(ThemeData.dark()))
      .copyWith(
          colorScheme: darkColorScheme,
          textTheme: globalTextTheme(ThemeData.dark()),
          splashColor: primaryColor.withOpacity(0.2),
          primaryColor: primaryColor,
          toggleableActiveColor: primaryColor,
          accentColor: accentColor,
          inputDecorationTheme: InputDecorationTheme()
              .copyWith(isDense: true, border: OutlineInputBorder()),
          appBarTheme: ThemeData.dark().appBarTheme.copyWith(
              textTheme: globalTextTheme(ThemeData.dark()),
              color: Colors.black,
              elevation: 1,
              iconTheme: IconThemeData(color: Colors.grey),
              brightness: Brightness.dark),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)))));

  static void statusTheme() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.grey,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.grey.shade100,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    });
  }
}
