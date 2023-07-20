import 'package:flutter/material.dart';
import 'category.dart';

class ExpenseData extends ChangeNotifier {
  List<Category> categories = [
    Category(name: 'Groceries', totalExpense: 0.0, expenses: []),
    Category(name: 'Bills', totalExpense: 0.0, expenses: []),
    Category(name: 'Travel', totalExpense: 0.0, expenses: []),
    Category(name: 'Tuition Fees', totalExpense: 0.0, expenses: []),
  ];

  void addCategory(String categoryName) {
    final newCategory = Category(
      name: categoryName,
      totalExpense: 0.0,
      expenses: [],
    );
    categories.add(newCategory);
    notifyListeners();
  }
}