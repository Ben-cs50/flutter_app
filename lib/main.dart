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
          title: const Text('Expense Tracker'),
          backgroundColor: const Color(0xFF1A1A24),

          iconTheme: const IconThemeData (color: Colors.white),
        ),
        
        
        drawer: Drawer(
          child: SafeArea( 
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0), 
                    child: ClipOval(
                      child: Image.network(
                        height: 50,
                        width: 50, 
                        fit: BoxFit.cover,
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRllE5B1hwxmrgl_Mof16Y7N3axkoBdjAsTUfCZ3DSeww&s=10',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                MenuItem(icon: Icons.home, title: 'Dashboard', onTap: () {}),
                const SizedBox(height: 10.0),
                MenuItem(title: 'Transactions', icon: Icons.receipt, onTap: () {}),
                const SizedBox(height: 10.0),
                MenuItem(title: 'Analytics', icon: Icons.analytics, onTap: () {}),
                const SizedBox(height: 10.0),
                MenuItem(title: 'Budgets', icon: Icons.account_balance, onTap: () {}),
              ],
            ),
          ),
        ),
        
        
        body: const Center(
          child: Text('Main Content Area (Dashboard, etc.)'),
        ),
      ),
    );
  }
}
