import 'package:bestie_vibes/pages/activity_retrieve.dart';
import 'package:bestie_vibes/pages/home_page.dart';
import 'package:bestie_vibes/pages/login_page.dart';
import 'package:bestie_vibes/pages/profile_page.dart';
import 'package:bestie_vibes/pages/splash_page.dart';
import 'package:flutter/material.dart';


class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return LoginPage.route();
      case LoginPage.routeName:
        return LoginPage.route();
      case HomePage.routeName:
        return HomePage.route();        
      case ProfilePage.routeName:
        return ProfilePage.route();
      case ActivityRetrieve.routeName:
        return ActivityRetrieve.route();        
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