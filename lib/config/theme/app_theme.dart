

import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get () {
    const seedColor =  Colors.deepOrangeAccent;
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      listTileTheme: const ListTileThemeData (
        iconColor: seedColor
      )
    );
  }
}