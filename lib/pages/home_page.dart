import 'package:bestie_vibes/config/theme.dart';
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
      body: Column(
        children: [
          UserCard(user: Userr.users[0]),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0, 
              horizontal: 60,),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceButton(
                width: 60, 
                height: 60, 
                size: 25, 
                color: Color.fromARGB(255, 253, 186, 192), 
                hasGradient: false,
                icon: Icons.clear_rounded,
                ),
                ChoiceButton(
                width: 80, 
                height: 80, 
                size: 30, 
                color: Colors.white,
                hasGradient: true, 
                icon: Icons.favorite,
                ),
                ChoiceButton(
                width: 60, 
                height: 60, 
                size: 25, 
                color: Color.fromARGB(255, 253, 186, 192),
                hasGradient: false, 
                icon: Icons.watch_later,
                ),
            ],
          )
          
      )],
      )
    );
  }
}

class UserCard extends StatelessWidget {
  final Userr user;

  const UserCard({Key? key, required this.user}) : super(key: key);

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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
              ),
              Column(
                children: [
                  Text(
                    '${user.name}, ${user.age}',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Colors.white,
                      ),
                  ),
                  Text(
                    '${user.jobTitle}',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                  ),
                ],
              )
            ],
          ),
        ));
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