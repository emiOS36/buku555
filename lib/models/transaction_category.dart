import 'package:buku_555_v2/models/transaction_type.dart';
import 'package:flutter/material.dart';

enum TransactionCategory {
  // Expense
  foodAndDrinks(
    'Food & Drinks',
    Icons.restaurant,
    Colors.orange,
    TransactionType.expense,
  ),
  shopping(
    'Shopping',
    Icons.shopping_cart_outlined,
    Colors.green,
    TransactionType.expense,
  ),
  bills('Bills', Icons.bolt, Colors.pinkAccent, TransactionType.expense),
  transport(
    'Transport',
    Icons.directions_car,
    Colors.blue,
    TransactionType.expense,
  ),
  others('Others', Icons.more_horiz, Colors.grey, TransactionType.expense),

  //Income
  salary(
    'Salary',
    Icons.apartment,
    Colors.deepPurpleAccent,
    TransactionType.income,
  ),
  freelance('Freelance', Icons.laptop_mac, Colors.teal, TransactionType.income),
  investment(
    'Investment',
    Icons.trending_up,
    Colors.indigo,
    TransactionType.income,
  ),
  gift('Gift', Icons.card_giftcard, Colors.amber, TransactionType.income),
  others2('Others', Icons.more_horiz, Colors.grey, TransactionType.income);

  const TransactionCategory(this.label, this.icon, this.color, this.type);

  final String label;
  final IconData icon;
  final Color color;
  final TransactionType type;

  static List<TransactionCategory> forType(TransactionType type) =>
      values.where((c) => c.type == type).toList();
}
