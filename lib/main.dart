import 'package:flutter/material.dart';
import 'package:expense_trucker/widgets/expenses.dart';

final kcolorScheme = ColorScheme.fromSeed(
        seedColor:const  Color.fromARGB(
          159, 82, 78, 140
          ),
      );

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kcolorScheme,
        appBarTheme:const AppBarTheme().copyWith(
          backgroundColor: kcolorScheme.onPrimaryContainer,
          foregroundColor: kcolorScheme.primaryContainer
        )
      ),
      home: const Expenses(),
    ),
  );
}
