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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          backgroundColor: const Color(0xFF1A1A24).withOpacity(0.8),
          elevation: 0,

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
                const Divider(color: Colors.grey, thickness: 0.5),
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
        
        
        body: SizedBox(
          height: double.infinity ,
          width: double.infinity,
          
          child: Image.network(
            'https://i.pinimg.com/474x/cb/90/9d/cb909db943872a2963aa92914b9fc754.jpg',
            fit: BoxFit.cover,
            ),
        
        ),
      ),
    );
  }
}
