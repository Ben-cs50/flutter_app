import 'package:expensetracker/pages/analytics.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 5, 97, 40),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("August Balance", style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "KES 20,000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.visibility_outlined, color: Colors.white),
                      const SizedBox(width: 30),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Text(
                            "Total Spent",
                            style: TextStyle(color: Colors.white),
                          ),

                          Text(
                            "KES 23,000",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          Text(
                            "This Month",
                            style: TextStyle(color: Colors.white),
                          ),

                          Text(
                            "Sept 29, 2026",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 18),

          // end of dashboard
          Padding(
            padding: const EdgeInsets.only(left:2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuickActionCard(title: "Add Expense", icon: Icons.add),
                 QuickActionCard(title: "Add Income", icon: Icons.send),
                  QuickActionCard(title: "More", icon: Icons.more_horiz),
              ],
            ),
          ),
          const SizedBox(height: 18),

           Padding(
             padding: const EdgeInsets.only(left:2.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Activity", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:18)),
                Text("See all", style: TextStyle(color: Colors.white)),

              ]
                     
             
                     ),
           ),
              SizedBox(height: 230,child: InsightPage()),

          //end of actions
        ],
        
      ),
     
    );
  }
}

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    super.key,
    required this.title,
     required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 80,
      width: 100,
      // alignment: Alignment.center,
     
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(1),
        borderRadius: BorderRadius.circular(20),
        
      ),
      
      child: Column(
        
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height:5),
          Text(title, style: TextStyle(color: Colors.white)),
    
          
          
    
        ]
    
      ),
      
    
    
    );
  }
}
