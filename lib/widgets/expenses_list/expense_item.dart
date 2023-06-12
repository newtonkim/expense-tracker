import 'package:flutter/material.dart';
import 'package:expense_trucker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 20),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.add_alarm),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      expense.date.toString(),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ), 
    );
  }
}
