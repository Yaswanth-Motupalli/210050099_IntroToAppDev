import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category.dart';
import 'expense_data.dart';
import 'addition_page.dart';

class CategoryPage extends StatelessWidget {
  final Category category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final expenseData = Provider.of<ExpenseData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Category: ${category.name}'),
      ),
      body: ListView.builder(
        itemCount: category.expenses.length,
        itemBuilder: (context, index) {
          final expense = category.expenses[index];
          return ListTile(
            title: Text(expense.name),
            subtitle: Text('Price: \$${expense.price.toStringAsFixed(2)}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdditionPage(category: category),
            ),
          ).then((value) {
            if (value != null) {
              // Add the expense to the category expenses list
              category.expenses.add(value);
              // Update the totalExpense of the category
              category.totalExpense += value.price;
              // Notify listeners about the change
              expenseData.notifyListeners();
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
