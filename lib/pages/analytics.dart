import 'package:expensetracker/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InsightPage extends StatefulWidget {
  const InsightPage({super.key});

  @override
  State<InsightPage> createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
  @override
  Widget build(BuildContext context) {
    List<TransactionModel> transactions = [
      TransactionModel(
        isIncoming: false,
        name: 'Kenya Power',
        type: 'expense',
        date: DateTime(2026, 09, 23),
        amount: 3000,
        category: 'Utilities'
      ),
      TransactionModel(
        isIncoming: true,
        name: 'Uber',
        type: 'income',
        date: DateTime(2026, 09, 23),
        amount: 30000,
        category: 'Transport'
      ),
      TransactionModel(
        isIncoming: false,
        name: 'QuickMart',
        type: 'expense',
        date: DateTime(2026, 09, 24),
        amount: 400,
        category: 'Shopping'
      ),
      TransactionModel(
        isIncoming: true,
        name: 'Mapato',
        type: 'income',
        date: DateTime(2026, 09, 2),
        amount: 25000,
        category:'Salary'
      ),
      TransactionModel(
        isIncoming: false,
        name: 'Carrefour',
        type: 'expense',
        date: DateTime(2026, 09, 21),
        amount: 800,
        category: 'Groceries'
      ),
      TransactionModel(
        isIncoming: false,
        name: 'Carrefour',
        type: 'expense',
        date: DateTime(2026, 09, 28),
        amount: 2000,
        category: 'Shopping'
      ),
    ];
    String dateHeader(DateTime cdate) {
      DateTime now = DateTime.now();

      DateTime today = new DateTime(now.year, now.month, now.day);
      if (cdate == today) {
        return "Today";
      }
      DateTime yesterday = today.subtract(Duration(days: 1));
      if (cdate == yesterday) {
        return "Yesterday";
      }

      return DateFormat.yMMMMEEEEd().format(cdate);

      // return cdate.toIso8601String();
    }

    final sortedTransactions = [...transactions]
      ..sort((a, b) => b.date.compareTo(a.date));

    Map<DateTime, List<TransactionModel>> grouped = {};
    for (final tx in sortedTransactions) {
      final txDate = new DateTime(tx.date.year, tx.date.month, tx.date.day);
      grouped.putIfAbsent(txDate, () => []);
      grouped[txDate]!.add(tx);
    }
    final dates = grouped.keys.toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:dates.length,
              itemBuilder: (BuildContext context, int index) {
                final cdate = dates[index];
                final dateTransanctions = grouped[cdate];
                for (var element in dateTransanctions!) {
                  print(element.toJson());
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(color: Colors.white),
                      child: Text(
                        dateHeader(cdate),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    ...dateTransanctions!.map((tx) {
                      return TxTile(transaction: tx);
                    }),
                  ],
                );

                // return ListTile(
                //   leading: const Icon(Icons.list),
                //   trailing: Text(
                //     sortedTransactions[index].name,
                //     style: TextStyle(color: Colors.white, fontSize: 24),
                //   ),
                // );
                //
              },
            ),
          ],
        ),
      ),
    );
    // Text("Pressed", style: TextStyle(color: Colors.white, fontSize: 24));
  }
}

class TxTile extends StatelessWidget {
  TxTile({super.key, required this.transaction});
  final TransactionModel transaction;
  final oCcy = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                 
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.card_travel, size: 18, color: Colors.white),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      transaction.category,
                      maxLines: 1,

                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                       transaction.name,
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],

                  
                ),
               
              ),
              // amount column
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${transaction.isIncoming ? '+' : '-'}\KES ${oCcy.format(transaction.amount)}',
                        style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      
                      
                    ),
                     Text(
                      transaction.name,
                      style: TextStyle(color: Colors.white, fontSize: 14),

                    
                    ),
                  ],
                ),
              // Icon(
              //   transaction.isIncoming
              //       ? Icons.arrow_downward
              //       : Icons.arrow_upward,
              //   size: 18,
              //   color: transaction.isIncoming ? Colors.green : Colors.red,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
