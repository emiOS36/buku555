import 'package:buku_555_v2/constants/app_constants.dart';
import 'package:buku_555_v2/models/transaction_category.dart';
import 'package:buku_555_v2/utils/field_decoration.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.categories,
  });

  final List<TransactionCategory> categories;
  final TransactionCategory value;
  final ValueChanged<TransactionCategory> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<TransactionCategory>(
      initialValue: value,
      isExpanded: true,
      borderRadius: AppSizes.borderRadius,
      icon: const Icon(Icons.keyboard_arrow_down),
      decoration: fieldDecoration(context).copyWith(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.fieldPadding,
          vertical: 8,
        ),
      ),
      items: [
        for (final category in categories)
          DropdownMenuItem(
            value: category,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: category.color,
                  child: Icon(category.icon, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 12),
                Text(category.label),
              ],
            ),
          ),
      ],
      onChanged: (category) {
        if (category != null) onChanged(category);
      },
    );
  }
}
