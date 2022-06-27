import 'package:bestie_vibes/pages/pages.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return LoginPage.route();
      case LoginPage.routeName:
        return LoginPage.route();
      case SwipePage.routeName:
        return SwipePage.route();
      case ProfilePage.routeName:
        return ProfilePage.route();
      case ActivityRetrieve.routeName:
        return ActivityRetrieve.route();        
      case GroupPage.routeName:
        return GroupPage.route();
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
