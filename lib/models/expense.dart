import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Categories { transport, food, fees, leisure, work}

class Expense {
  Expense({
      required this.title, 
      required this.amount, 
      required this.date,
      required this.category,
    }) :id = uuid.v4();


  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categories category;

}
