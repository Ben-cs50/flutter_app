
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {

  final IconData icon;
  final  String title;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.title,
    required this.onTap,
    this.icon = Icons.phone
   
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: InkWell(
       onTap: onTap,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 236, 238, 237),
            borderRadius: BorderRadius.circular(10),
            
        
            // border: Border.fromBorderSide(color: Colors.grey.withOpacity(1)),
          ),
          child: Row(
            children: [
              Icon(icon),
              Text(title),
              
              
              
            ],
          ),
        ),
      ),
    );
  }
}