import 'package:expensetracker/model/transaction.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  final TransactionModel ? transactions;
  ActivityPage({super.key, this.activeFilter = "All", this.transactions});
  String activeFilter;

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      
      children: [
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilterCard(
                title: "All",
                onTap: () {
                  setState(() {
                    widget.activeFilter = "All";
                  });
                },
                isActive: widget.activeFilter == "All",
              ),
              const SizedBox(width: 10),
              FilterCard(
                isActive: widget.activeFilter == "Groceries",
                onTap: () {
                  setState(() {
                    widget.activeFilter = "Groceries";
                  });
                },
                title: "Groceries",
                // color: Colors.green,
              ),
              const SizedBox(width: 10),
              FilterCard(
                isActive: widget.activeFilter == "Shopping",
                onTap: () {
                  setState(() {
                    widget.activeFilter = "Shopping";
                  });
                },
                title: "Shopping",
                // color: Colors.green,
              ),
              const SizedBox(width: 10),
              FilterCard(
                isActive: widget.activeFilter == "Food",
                onTap: () {
                  setState(() {
                    widget.activeFilter = "Food";
                  });
                },
                title: "Food",
                // color: Colors.green,
              ),
              const SizedBox(width: 10),
              FilterCard(
                isActive: widget.activeFilter == "Transport",
                onTap: () {
                  setState(() {
                    widget.activeFilter = "Transport";
                  });
                },
                title: "Transport",
                // color: Colors.orange,
              ),
              const SizedBox(width: 10),
              FilterCard(
                isActive: widget.activeFilter == "Utilities",
                onTap: () {
                  setState(() {
                    widget.activeFilter = "Utilities";
                  });
                },
                title: "Utilities",
                // color: Colors.white,
              ),
              const SizedBox(width: 10),
              FilterCard(
                isActive: widget.activeFilter == "Internet",
                onTap: () {
                  setState(() {
                    widget.activeFilter = "Internet";
                  });
                },
                title: "Internet",
                // color: Colors.pink,
              ),
     
            ],
          ),
        ),
      ],
    );
  }
}

class FilterCard extends StatelessWidget {
  FilterCard({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
    this.color = const Color.fromARGB(255, 5, 97, 40),
  });

  final String title;
  Color color;
  GestureTapCallback ? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        constraints: BoxConstraints(minWidth: 40),
        decoration: BoxDecoration(
          color: isActive ? color : const Color.fromARGB(255, 250, 250, 250),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: isActive ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}


