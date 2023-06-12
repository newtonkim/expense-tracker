import 'package:flutter/material.dart';
import 'package:expense_trucker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenses, {super.key});

  final List<Expense> expenses;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Text(expenses[index].title),
    );
  }
}
