import 'package:bestie_vibes/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:bestie_vibes/components/auth_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/constants.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => SplashPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends AuthState<SplashPage> {
  bool _newUser = true;

  @override
  void initState() {
    recoverSupabaseSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void onAuthenticated(Session session) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }

  @override
  void onErrorAuthenticating(String message) {
    // TODO: implement onErrorAuthenticating
  }

  @override
  void onPasswordRecovery(Session session) {
    // TODO: implement onPasswordRecovery
  }

  @override
  void onUnauthenticated() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false);
  }


}
