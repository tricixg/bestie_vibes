import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.pink[50],
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Image.asset(
              'lib/assets/images/main.png',
              height: 50,
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ))
        ],
      ),
   
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}
