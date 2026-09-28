import 'package:expensetracker/pages/analytics.dart';
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
  int _currentPageIndex = 0;

  // 1. Add all 4 screens to match your 4 navigation destinations
  final List<Widget> _screens = [
    const Center(child: Text(' ', style: TextStyle(color: Colors.white, fontSize: 24))),
    const Center(child: Text(' ', style: TextStyle(color: Colors.white, fontSize: 24))),
    InsightPage(),
    const Center(child: Text(' ', style: TextStyle(color: Colors.white, fontSize: 24))),
  ];

    final List<String> _titles = [
    'Home',
    'Activity',
    'Your Spending',
    'Settings'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title:  Text(_titles[_currentPageIndex] ),
        backgroundColor: const Color(0xFF1A1A24).withOpacity(0.8),
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // 2. Use a Stack to keep the background image behind the active screen
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
              'https://i.pinimg.com/474x/cb/90/9d/cb909db943872a2963aa92914b9fc754.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Dark overlay to make text readable over the background image
          Container(color: Colors.black.withOpacity(0.4)),
          // Active content screen
          SafeArea(
            child: _screens[_currentPageIndex],
          ),
        ],
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
            selectedIcon: Icon(Icons.analytics),
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

