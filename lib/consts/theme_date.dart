import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          //0A1931  // white yellow 0xFFFCF8EC
          isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
      primaryColor: Color.fromARGB(255, 102, 13, 17),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? Color.fromARGB(255, 24, 24, 44) : const Color(0xFFE8FDFD),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? Color.fromARGB(255, 0, 0, 0) : const Color(0xFFF2FDFD),
      canvasColor: isDarkTheme ? Color.fromARGB(255, 114, 36, 36) : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
