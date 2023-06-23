import 'package:flutter/material.dart';
import 'package:expense_trucker/widgets/expenses.dart';

final kcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(159, 82, 78, 140),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kcolorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kcolorScheme.onPrimaryContainer,
            foregroundColor: kcolorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
            color: kcolorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kcolorScheme.onSecondaryContainer,
            fontSize: 14,
          )
        )
      ),
      home: const Expenses(),
    ),
  );
}
