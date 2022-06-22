import 'package:flutter/material.dart';
import 'package:bestie_vibes/components/auth_state.dart';

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
  @override
  void initState() {
    recoverSupabaseSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ElevatedButton(
        child: Text('Account'),
        onPressed: () {
          Navigator.pushNamed(context, '/account');
        },
      ),
    );
  }
}
