class TableModel {
  int? id;
  String amount;
  String month;
  String category;

  TableModel(
      {this.id,
      required this.amount,
      required this.month,
      required this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'month': month,
      'category': category,
    };
  }

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(
      id: map['id'],
      amount: map['amount'],
      month: map['month'],
      category: map['category'],
    );
  }
}
