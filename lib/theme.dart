import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple, brightness: Brightness.light),
  dividerColor: Colors.grey[400],
  highlightColor: Colors.purple,
  cardColor: Colors.grey[300],
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.grey[200],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      backgroundColor: const WidgetStatePropertyAll(Colors.purple),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
    ),
  ),
);

final dartTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple, brightness: Brightness.dark),
  dividerColor: Colors.grey[400],
  highlightColor: Colors.purple,
  cardColor: Colors.white38,
  canvasColor: Colors.white30,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      backgroundColor: const WidgetStatePropertyAll(Colors.purple),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
    ),
  ),
);
