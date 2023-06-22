import 'package:flutter/material.dart';
import 'package:expense_trucker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true, scaffoldBackgroundColor: Color.fromARGB(159, 82, 78, 140)),
      home:const Expenses(),
    ),
  );
}
