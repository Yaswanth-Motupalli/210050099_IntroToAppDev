import 'package:flutter/material.dart';
import 'category.dart';
import 'expense_data.dart';

class AdditionPage extends StatelessWidget {
  final Category category;
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  AdditionPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Expense Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Expense Price'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final price = double.tryParse(_priceController.text);
                if (name.isNotEmpty && price != null) {
                  Navigator.pop(
                    context,
                    Expense(name: name, price: price),
                  );
                }
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
