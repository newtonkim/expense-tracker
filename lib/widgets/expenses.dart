import 'package:expense_trucker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_trucker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Courses',
        amount: 20.95,
        category: Categories.fees,
        date: DateTime.now()),
    Expense(
        title: 'Cinema',
        amount: 12.95,
        category: Categories.leisure,
        date: DateTime.now()),
    Expense(
        title: 'Mombasa Travel',
        amount: 123.95,
        category: Categories.transport,
        date: DateTime.now())
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: ExpensesList(_registeredExpenses),
          ),
        ],
      ),
    );
  }
}
