class Category {
  String name;
  double totalExpense;
  List<Expense> expenses;

  Category({required this.name, required this.totalExpense, required this.expenses});
}

class Expense {
  String name;
  double price;

  Expense({required this.name, required this.price});
}