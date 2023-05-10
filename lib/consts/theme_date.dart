import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          //0A1931  // white yellow 0xFFFCF8EC
          isDarkTheme ? const Color(0xFF00001a) : Color.fromARGB(183, 255, 255, 255),
      primaryColor: Color.fromARGB(255, 102, 13, 17),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? Color.fromARGB(255, 24, 24, 44) : Color.fromARGB(255, 102, 13, 17),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? Color.fromARGB(255, 0, 0, 0) : Color.fromARGB(143, 253, 253, 253),
      canvasColor: isDarkTheme ? Color.fromARGB(255, 114, 36, 36) : Color.fromARGB(255, 250, 250, 250),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
