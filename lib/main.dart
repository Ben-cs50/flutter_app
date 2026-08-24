import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(), 
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Track the active index here
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        backgroundColor: const Color(0xFF1A1A24).withOpacity(0.8),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.network(
          'https://i.pinimg.com/474x/cb/90/9d/cb909db943872a2963aa92914b9fc754.jpg',
          fit: BoxFit.cover,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60.0,
        backgroundColor: Colors.amber[50],
        selectedIndex: _currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Activity',
          ),
           NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics_outlined),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
