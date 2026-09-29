
class TransactionModel {
  final String name;
  final String category;
  final String type;
  final DateTime date;
  final double amount;
  final bool isIncoming;

  TransactionModel({
    required this.name,
    required this.type,
    required this.date,
    required this.amount,
     required this.isIncoming,
     required this.category

  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      name: json['name'],
      type: json['type'],
      date: json['date'],
      amount: json['amount'],
      isIncoming: json['isIncoming'],
      category: json['category']

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type ,
      'date': date,
      'amount': amount,
      'isIncoming': isIncoming,
      'catgory': category,
    };
  }
}