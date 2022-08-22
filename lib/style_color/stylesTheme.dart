import 'package:flutter/material.dart';

import 'my_app_theme.dart';

void themeInitial({required StateWidgetState myStyleThemeProvider}) {
  myStyleThemeProvider.profileStyleChange();
}

void themeTwo({required StateWidgetState myStyleThemeProvider}) {
  myStyleThemeProvider.profileStyleChange(
    colorText: Colors.black54,
    colorPrimary: Colors.red,
    secondaryPrimary: Colors.yellow,
    backgroundColor: Colors.red.shade50,
  );
}

void themeTree({required StateWidgetState myStyleThemeProvider}) {
  myStyleThemeProvider.profileStyleChange(
    colorText: Colors.white70,
    colorPrimary: Colors.teal,
    secondaryPrimary: Colors.green,
    backgroundColor: Colors.indigo.withOpacity(0.2),
  );
}
