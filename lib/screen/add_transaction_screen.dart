import 'package:flutter/material.dart';

class _Category {
  final String name;
  final IconData icon;
  final Color color;
  const _Category(this.name, {required this.icon, required this.color});
}

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  static const Color _green = Color(0xFF2E7D4F);
  static const Color _fieldColor = Color(0xFFF3F4F6);
  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final List<_Category> _categories = const [
    _Category('Food & Drinks', Icons.restaurant, Colors.orange),
    _Category('Shopping', Icons.shopping_cart_outlined, Colors.green),
    _Category('Bills', Icons.bolt, Colors.pinkAccent),
    _Category('Transport', Icons.directions_car, Colors.blue),
    _Category('Others', Icons.more_horiz, Colors.grey),
  ];

  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _notesController = TextEditingController();

  final bool _isExpense = true;
  late final _Category _selectedCategory = _categories.first;
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime d) =>
      '${d.day} ${_months[d.month - 1]} ${d.year}';

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
