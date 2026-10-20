enum TransactionType {
  expense('Expense'),
  income('Income');

  const TransactionType(this.label);

  final String label;
}
