import 'package:bestie_vibes/pages/home/group_page.dart';
import 'package:bestie_vibes/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bestie_vibes/components/auth_state.dart';
import 'package:bestie_vibes/widgets/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
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
  int _selectedIndex = 0;
  final List<Widget> screens = [ GroupPage(), MemoriesPage(), StatisticsPage(), ProfilePage()];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: Container(
            color: Color.fromARGB(255, 253, 186, 192),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: GNav(
                  gap: 8,
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState((){
                      _selectedIndex = index;
                    });
                  },
                  backgroundColor: Color.fromARGB(255, 253, 186, 192),
                  color: Colors.blueGrey,
                  activeColor: Colors.white,
                  tabBackgroundColor: Color.fromARGB(255, 254, 143, 152),
                  padding: EdgeInsets.all(16),
                  tabs: const [
                    GButton(icon: CupertinoIcons.person_2_fill, text: 'Groups'),
                    GButton(
                        icon: CupertinoIcons.square_favorites_alt_fill,
                        text: 'Memories'),
                    GButton(
                        icon: CupertinoIcons.graph_circle_fill, text: 'Statistics'),
                    GButton(icon: Icons.settings, text: 'Settings')
                  ]),
            ),
          ),

        // Column(children: [
        //   Groupp(),
        // ],)
        // Column(children: <Widget>[
        //   // PageSelector(),
        //   Expanded(
        //       child: Container(
        //           decoration: BoxDecoration(
        //     color: Color.fromARGB(255, 252, 221, 221),
        //     borderRadius: BorderRadius.only(
        //     //  topLeft: Radius.circular(30.0),
        //       topRight: Radius.circular(30.0),
        //     ),
        //   ),
        //       child: 
        //       Column(
        //         children: <Widget>[
                  //Groupp(),
                  // Individuals(),

      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}