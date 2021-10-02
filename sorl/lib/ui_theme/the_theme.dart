import 'package:flutter/material.dart';

class TheTheme with ChangeNotifier {
  bool isDark = true;

  ThemeMode currentTheme() {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
