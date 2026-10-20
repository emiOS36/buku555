import 'package:buku_555_v2/constants/app_constants.dart';
import 'package:buku_555_v2/models/transaction_type.dart';
import 'package:flutter/material.dart';

class TransactionTypeToggle extends StatelessWidget {
  const TransactionTypeToggle({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final TransactionType selected;
  final ValueChanged<TransactionType> onChanged;

  /// Background color of a segment when it is selected.
  Color _selectedColor(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return Colors.red.shade700;
      case TransactionType.income:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    // The outer Material clips the row, so only the outside corners are
    // rounded and the edge between the two segments stays square.
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      borderRadius: AppSizes.borderRadius,
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          for (final type in TransactionType.values)
            Expanded(
              child: _Segment(
                label: type.label,
                isSelected: type == selected,
                selectedColor: _selectedColor(type),
                onTap: () => onChanged(type),
              ),
            ),
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.isSelected,
    required this.selectedColor,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? selectedColor : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? AppColors.onPrimary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
