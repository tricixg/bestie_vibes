import 'package:bestie_vibes/widgets/individuals.dart';
import 'package:flutter/material.dart';
import 'package:bestie_vibes/components/auth_state.dart';
import 'package:bestie_vibes/widgets/widgets.dart';
import 'package:bestie_vibes/models/models.dart';

class GroupPage extends StatefulWidget {
  static const String routeName = '/group';
  const GroupPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => GroupPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends AuthState<GroupPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'HOME',
        ),
        body: Column(children: <Widget>[
          PageSelector(),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 186, 192),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
              child: Column(
                children: <Widget>[
                  Individuals(),
                  Groupp(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}