import 'package:buku_555_v2/constants/app_constants.dart';
import 'package:buku_555_v2/utils/date_formatter.dart';
import 'package:buku_555_v2/utils/field_decoration.dart';
import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({
    super.key,
    required this.date,
    required this.onChanged,
  });

  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) onChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pickDate(context),
      borderRadius: AppSizes.borderRadius,
      child: InputDecorator(
        decoration: fieldDecoration(context).copyWith(
          prefixIcon: const Icon(Icons.calendar_today_outlined),
        ),
        child: Text(
          formatDate(date),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
