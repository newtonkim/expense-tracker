import 'package:expense_trucker/widgets/chart/chart.dart';
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
        date: DateTime.now())
  ];

// method of adding an expense
  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

// method for removing an expense
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpenses),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text(
        'No Expenses Found. Please add some!',
        style: TextStyle(fontSize: 18),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(_registeredExpenses, _removeExpense);
    }
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
      body: width < 600
          ? Column(
              children: [
                // Add ToolBar with Add button
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expenses: _registeredExpenses
                  ),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
