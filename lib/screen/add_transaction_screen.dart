import 'package:buku_555_v2/widget/category_dropdown.dart';
import 'package:buku_555_v2/widget/date_picker_field.dart';
import 'package:buku_555_v2/widget/form_field_label.dart';
import 'package:buku_555_v2/widget/transaction_type_toggle.dart';
import 'package:buku_555_v2/constants/app_constants.dart';
import 'package:buku_555_v2/models/transaction_category.dart';
import 'package:buku_555_v2/models/transaction_model.dart';
import 'package:buku_555_v2/models/transaction_type.dart';
import 'package:buku_555_v2/utils/field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _notesController = TextEditingController();

  TransactionType _type = TransactionType.expense;
  TransactionCategory _category = TransactionCategory.foodAndDrinks;
  DateTime _date = DateTime.now();

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String? _validateAmount(String? value) {
    final amount = double.tryParse(value ?? '');
    if (amount == null || amount <= 0) return 'Enter a valid amount';
    return null;
  }

  String? _validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter a description';
    return null;
  }

  /// Switching Expense/Income also switches to a category that exists
  /// for the new type.
  void _onTypeChanged(TransactionType type) {
    setState(() {
      _type = type;
      _category = TransactionCategory.forType(type).first;
    });
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final notes = _notesController.text.trim();
    final transaction = TransactionModel(
      amountInSen: (double.parse(_amountController.text) * 100).round(),
      type: _type,
      category: _category,
      date: _date,
      description: _descriptionController.text.trim(),
      notes: notes.isEmpty ? null : notes,
    );

    // Hand the result back to whichever screen opened this one.
    Navigator.pop(context, transaction);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isExpense = _type == TransactionType.expense;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Transaction',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.screenPadding,
            8,
            AppSizes.screenPadding,
            24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TransactionTypeToggle(
                  selected: _type,
                  onChanged: _onTypeChanged,
                ),

                const FormFieldLabel('Amount'),
                TextFormField(
                  controller: _amountController,
                  validator: _validateAmount,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\.?\d{0,2}'),
                    ),
                  ],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: fieldDecoration(
                    context,
                    hint: 'RM 0.00',
                    hintStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ),

                const FormFieldLabel('Description'),
                TextFormField(
                  controller: _descriptionController,
                  validator: _validateDescription,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: fieldDecoration(
                    context,
                    hint: isExpense
                        ? 'e.g. Lunch, Groceries, etc.'
                        : 'e.g. Salary, Bonus, etc.',
                  ),
                ),

                const FormFieldLabel('Category'),
                CategoryDropdown(
                  // New key = fresh dropdown whenever the type changes.
                  key: ValueKey(_type),
                  categories: TransactionCategory.forType(_type),
                  value: _category,
                  onChanged: (category) => setState(() => _category = category),
                ),

                const FormFieldLabel('Date'),
                DatePickerField(
                  date: _date,
                  onChanged: (date) => setState(() => _date = date),
                ),

                const FormFieldLabel('Notes (optional)'),
                TextFormField(
                  controller: _notesController,
                  maxLines: 2,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: fieldDecoration(context, hint: 'Add a note...'),
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _save,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppSizes.borderRadius,
                      ),
                    ),
                    child: Text(
                      isExpense ? 'Save Expense' : 'Save Income',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
