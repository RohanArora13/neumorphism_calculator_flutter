import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

class Pallete {
  // Colors
  static const blackColor = Color.fromRGBO(0, 0, 0, 1); // primary
  static const scafoldBackgorundColorDark =
      Color.fromRGBO(43, 60, 62, 1); // primary color
  static const scafoldBackgorundColorLight =
      Color.fromRGBO(116, 144, 183, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const lightGreyColor = Color.fromRGBO(176, 176, 176, 0.237);
  static const darkshadowColor = Color.fromRGBO(16, 16, 16, 0.788);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;

  MaterialColor shadow = MaterialColor(
    Colors.purpleAccent.value,
    <int, Color>{
      100: Colors.purpleAccent.withOpacity(0.2),
      200: Colors.purpleAccent.withOpacity(0.3),
      300: Colors.purpleAccent.withOpacity(0.4),
      400: Colors.purpleAccent.withOpacity(0.5),
      500: Colors.purpleAccent.withOpacity(0.6),
      600: Colors.purpleAccent.withOpacity(0.7),
      700: Colors.purpleAccent.withOpacity(0.8),
      800: Colors.purpleAccent.withOpacity(0.9),
      900: Colors.purpleAccent.withOpacity(1),
    },
  );
  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: scafoldBackgorundColorDark,
    //shadowColor: darkshadowColor,
    extensions: <ThemeExtension<dynamic>>[
      CustomColors.dark,
    ],
    cardColor: greyColor,
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: lightGreyColor),
    appBarTheme: const AppBarTheme(
        backgroundColor: drawerColor,
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        textTheme: TextTheme(titleMedium: TextStyle(color: whiteColor))),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: redColor,
    backgroundColor:
        drawerColor, // will be used as alternative background color
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: scafoldBackgorundColorLight,
    cardColor: greyColor,
    extensions: <ThemeExtension<dynamic>>[
      CustomColors.light,
    ],
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: lightGreyColor),
    appBarTheme: const AppBarTheme(
        foregroundColor: greyColor,
        backgroundColor: whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: blackColor,
        ),
        textTheme: TextTheme(titleMedium: TextStyle(color: greyColor))),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: redColor,
    backgroundColor: whiteColor,
  );
}

final themeNotifierProvider =
    StateNotifierProvider<themeNotifier, ThemeData>((ref) {
  return themeNotifier();
});

class themeNotifier extends StateNotifier<ThemeData> {
  ThemeMode _mode;
  themeNotifier({ThemeMode mode = ThemeMode.light})
      : _mode = mode,
        super(Pallete.lightModeAppTheme) {
    getTheme();
  }
  ThemeMode get mode => _mode;

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == "light") {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
      prefs.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
      prefs.setString("theme", "dark");
    }
  }
}
