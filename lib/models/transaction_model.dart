import 'package:buku_555_v2/models/transaction_category.dart';
import 'package:buku_555_v2/models/transaction_type.dart';

class TransactionModel {
  const TransactionModel({
    required this.amountInSen,
    required this.type,
    required this.category,
    required this.date,
    required this.description,
    this.notes,
  });

  /// Always positive. Stored in sen (RM 1.00 = 100) to avoid double errors.
  final int amountInSen;
  final TransactionType type;
  final TransactionCategory category;
  final DateTime date;
  final String description;
  final String? notes;

  /// Negative for expenses, positive for income.
  int get signedAmountInSen =>
      type == TransactionType.expense ? -amountInSen : amountInSen;
}
