import 'package:flutter/material.dart';

class PageSelector extends StatefulWidget {
  @override
  _PageSelectorState createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  int selectedIndex = 0;
  final List<String> pages = ['Memories', 'Friends', 'Statistics'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: Text(
                pages[index],
                style: TextStyle(
                  color: index == selectedIndex ? Color.fromARGB(255, 254, 143, 152) : Color.fromARGB(255, 253, 186, 192),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}