import 'package:flutter/material.dart';
import 'package:expense_trucker/models/expense.dart';
import 'package:flutter/rendering.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
// use text editing controller to handle and store user input
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime? _selectedDate;
  Categories _selectedCategory = Categories.leisure;

  void submitExpenseData() {
    //convert a string amount to a double by using double.tryParse()
    final enteredAmount = double.tryParse(_amountInputController.text);
    final invalidAmount = enteredAmount == null || enteredAmount <= 0;
    if (_titleInputController.text.trim().isEmpty ||
        invalidAmount ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
          title: _titleInputController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

// call this method to destroy any user input after storage
  @override
  void dispose() {
    _titleInputController.dispose();
    _amountInputController.dispose();
    super.dispose();
  }

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, Constraints) {
      final width = Constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyBoardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleInputController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: TextField(
                          controller: _amountInputController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$',
                            label: Text('Amount'),
                          ),
                        ),
                      )
                    ],
                  )
                else
                  TextField(
                    controller: _titleInputController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _amountInputController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: '\$',
                          label: Text('Amount'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //use a ternary to check if date is empty
                          Text(
                            _selectedDate == null
                                ? 'No date selected'
                                : formatter.format(_selectedDate!),
                          ),
                          IconButton(
                            onPressed: presentDatePicker,
                            icon: const Icon(Icons.calendar_month),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    DropdownButton(
                        value:
                            _selectedCategory, // allows the selected value to appear on the screen
                        items: Categories.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        }),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: submitExpenseData,
                      child: const Text('Save Expense'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
