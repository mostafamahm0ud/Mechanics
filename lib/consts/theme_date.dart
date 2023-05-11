import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? const Color(0xFF00001a)
          : Color.fromARGB(183, 255, 255, 255),
      primaryColor: Color.fromRGBO(119, 16, 76, 0.644),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme
                ? Color.fromARGB(255, 24, 24, 44)
                : Color.fromRGBO(119, 16, 76, 0.644),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor: isDarkTheme
          ? Color.fromRGBO(119, 16, 76, 0.644)
          : Color.fromARGB(143, 253, 253, 253),
      canvasColor: isDarkTheme
          ? Color.fromRGBO(119, 16, 76, 0.644)
          : Color.fromARGB(255, 250, 250, 250),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
