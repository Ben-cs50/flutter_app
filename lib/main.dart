import 'package:expensetracker/widgets/menu_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          backgroundColor: const Color.fromARGB(222, 26, 223, 125),
        ),

        body: Column(
          children: [
            SizedBox(height: 10.0),
            ClipOval(
              child: Image.network(
                height: 50,
                fit: BoxFit.cover,
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRllE5B1hwxmrgl_Mof16Y7N3axkoBdjAsTUfCZ3DSeww&s=10',
              ),
            ),
            SizedBox(height: 10.0),
            MenuItem(icon: Icons.home, title: 'Dashboard'),
            SizedBox(height: 10.0),
            MenuItem(title: 'Transactions', icon: Icons.receipt),
            SizedBox(height: 10.0),
            MenuItem(title: 'Analytics', icon: Icons.analytics),
            SizedBox(height: 10.0),
            MenuItem(title: 'Budgets', icon: Icons.account_balance),
          ],
        ),
      ),
    );
  }
}
