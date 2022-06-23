import 'dart:html';

import 'package:flutter/material.dart';
import 'package:bestie_vibes/components/auth_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/models/models.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/splash';
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomePage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends AuthState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: UserCard(user: Userr.users[0]),
    );
  }
}

class UserCard extends StatefulWidget {
  final Userr user;

  const UserCard({
    Key? key, 
  required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(user.imageUrls[0])),
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 4,
                          offset: Offset(3, 3)),
                    ]),
              ),
              Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(200, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                )
                ),
                )
            ],
          ),
        ));
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

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
              Navigator.pushNamed(context, '/account');
            },
            icon: Icon(Icons.person, color: Colors.pink[200]))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}
