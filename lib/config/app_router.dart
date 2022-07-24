import 'package:bestie_vibes/pages/old/add_friends.dart';
import 'package:bestie_vibes/pages/chat%20page/chatroom_page.dart';
import 'package:bestie_vibes/pages/pages.dart';
import 'package:bestie_vibes/pages/home/room_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return LoginPage.route();
      case LoginPage.routeName:
        return LoginPage.route();
      case PageDefault.routeName:
        return PageDefault.route();
      case ProfilePage.routeName:
        return ProfilePage.route();
      // case SwipePage.routeName:
      //   return SwipePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case MemoriesPage.routeName:
        return MemoriesPage.route();
      case StatisticsPage.routeName:
        return StatisticsPage.route();
      // case AddFriends.routeName:
      //   return AddFriends.route();
      // case NewOutingPage.routeName:
      //   return NewOutingPage.route();
      case RoomPage.routeName:
        return RoomPage.route();
      // case ChatRoomPage.routeName:
      //   return ChatRoomPage.route();
      case SplashPage.routeName:
        return SplashPage.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
