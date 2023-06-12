import 'package:flutter/material.dart';
import 'package:expense_trucker/models/expense.dart';
import 'package:expense_trucker/widgets/new_expense.dart';
import 'package:expense_trucker/widgets/expenses_list/expenses_list.dart';

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
        date: DateTime.now()
    )
  ];

  void _openAddExpenseOverlay() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => const NewExpense(),
      );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Akiba Expense Trucker',
          style: TextStyle(
              color: Color.fromARGB(255, 127, 226, 132),
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          // Add ToolBar with Add button
          const Text('The Chart'),
          Expanded(
            child: ExpensesList(_registeredExpenses),
          ),
        ],
      ),
    );
  }
}
