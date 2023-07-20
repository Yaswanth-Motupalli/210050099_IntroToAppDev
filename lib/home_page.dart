import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category.dart';
import 'category_page.dart';
import 'expense_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenseData = Provider.of<ExpenseData>(context);
    final totalExpenses = calculateTotalExpenses(expenseData.categories);

    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Tracker App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'User-Name',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  'me@gmail.com',
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              'Total Expenses: \$${totalExpenses.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: expenseData.categories.length,
                itemBuilder: (context, index) {
                  final category = expenseData.categories[index];
                  return ListTile(
                    title: Text(category.name),
                    subtitle: Text('Total Expense: \$${category.totalExpense.toStringAsFixed(2)}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPage(category: category),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddCategoryDialog(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  double calculateTotalExpenses(List<Category> categories) {
    double total = 0.0;
    for (var category in categories) {
      total += category.totalExpense;
    }
    return total;
  }
}

class AddCategoryDialog extends StatefulWidget {
  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Category'),
      content: TextField(
        controller: _categoryController,
        decoration: InputDecoration(labelText: 'Category Name'),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            final categoryName = _categoryController.text.trim();
            if (categoryName.isNotEmpty) {
              // Add the new category using the addCategory method from ExpenseData
              Provider.of<ExpenseData>(context, listen: false).addCategory(categoryName);
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
