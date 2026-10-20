import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String category;
  final String date;
  final double amount; // negative = expense, positive = income

  const TransactionTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final bool isIncome = amount >= 0;
    final String sign = isIncome ? '+' : '-';

    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: .bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$category • $date',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '$sign'
            'RM ${amount.abs().toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w600,
              color: isIncome ? Colors.green[800] : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
