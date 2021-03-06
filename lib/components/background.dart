import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "lib/assets/images/top.png",
              width: size.width
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: Image.asset(
              "lib/assets/images/main.png",
              width: size.width * 0.32
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "lib/assets/images/bottom.png",
              width: size.width
            ),
          ),
          child
        ],
      ),
    );
  }
}