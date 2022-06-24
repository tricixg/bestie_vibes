import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                'HOME',
                style: Theme.of(context).textTheme.headline2,
              ))
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: Icon(Icons.person, color: Colors.pink[200]))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}

