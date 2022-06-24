import 'package:bestie_vibes/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:bestie_vibes/components/auth_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

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
      body: BlocBuilder<SwipeBloc, SwipeState>(builder: (context, state) {
        if (state is SwipeLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SwipeLoaded) {
          return Column(
            children: [            Draggable(
              child: UserCard(user: Userr.users[0]),
              feedback: UserCard(user: Userr.users[0]),
              childWhenDragging: UserCard(user: Userr.users[1]),
              onDragEnd: (drag) {
                if (drag.velocity.pixelsPerSecond.dx < 0) {
                  print('swipe left');
                } else {
                  print('swipe right');
                }
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 60,
                ),
                child: Row(
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
                ))],
          );
        }
        return Column(
          children: [],
        );
      },
      ),
    );
  }
}
