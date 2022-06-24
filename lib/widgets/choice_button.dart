import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasGradient;
  final IconData icon;

  const ChoiceButton({
    Key? key,
    required this.width, 
    required this.height, 
    required this.size, 
    required this.color,
    required this.hasGradient,
    required this.icon,
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle, 
        color: Colors.white,
        gradient: hasGradient
            ? LinearGradient(
                colors: [
                  Color.fromARGB(255, 253, 186, 192),
                  Color.fromARGB(255, 254, 143, 152),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(3,3),
      ),
      ]),
      child: Icon(icon, color: color,),
    );
  }
}