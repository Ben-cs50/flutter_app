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
    final oCcy = new NumberFormat("#,##0.00", "en_US"); 

    List<TransactionModel> transactions = [
      TransactionModel(
        isIncoming: false,
        name: 'Utilities',
        type: 'expense',
        date: DateTime(2026, 09, 23),
        amount: 3000,
      ),
      TransactionModel(
        isIncoming: true,
        name: 'Salary',
        type: 'income',
        date: DateTime(2026, 09, 23),
        amount: 30000,
      ),
      TransactionModel(
        isIncoming: false,
        name: 'Shopping',
        type: 'expense',
        date: DateTime(2026, 09, 24),
        amount: 400,
      ),
      TransactionModel(
        isIncoming: true,
        name: 'Salary',
        type: 'income',
        date: DateTime(2026, 09, 2),
        amount: 25000,
      ),
      TransactionModel(
        isIncoming: false,
        name: 'Groceries',
        type: 'expense',
        date: DateTime(2026, 09, 21),
        amount: 800,
      ),
       TransactionModel(
        isIncoming: false,
        name: 'Shopping',
        type: 'expense',
        date: DateTime(2026, 09, 28),
        amount: 2000,
        )
    ];
    String dateHeader(DateTime cdate){
      DateTime now =  DateTime.now();
      
        DateTime today = new DateTime(now.year, now.month, now.day);
        if(cdate==today) {
          return "Today";
        }
         DateTime yesterday = today.subtract(Duration(days: 1));
        if(cdate==yesterday) {
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
             
         

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dates.length,
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
                    decoration: BoxDecoration(color: Colors.white),
                     child: Text(
                                dateHeader(cdate),
                                style: TextStyle(color: Colors.black, fontSize: 14),
                              ),
                   ),
                  ...dateTransanctions!.map((tx)  {return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.list, size: 18, color: Colors.white),
                      SizedBox(width: 30),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.name,
                              
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${tx.isIncoming ? '+' : '-'}\KES ${oCcy.format(tx.amount)}',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        tx.isIncoming
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                        size: 18,
                        color: tx.isIncoming
                            ? Colors.green
                            : Colors.red,
                      ),
                    ],
                  );}),
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
    );
    // Text("Pressed", style: TextStyle(color: Colors.white, fontSize: 24));
  }
}
