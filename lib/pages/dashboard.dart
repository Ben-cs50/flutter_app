import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                        Text(
                          "August Balance",
                          style:TextStyle(color: Colors.white)
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children:[
                            Text(
                               "KES 20,000",
                               style:TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                               
                            ),
                            Spacer(),
                            Icon(
                              Icons.visibility_outlined,
                              color: Colors.white
                            ),
                            const SizedBox(width: 30),
                          ]

                        ),
                        
                      ]
                    
                    ),
                  ),
            
          
        ),
      
        ]
          
        
        
       
      ),
    );
  }
}