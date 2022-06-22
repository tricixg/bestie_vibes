import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bestie_vibes/pages/account_page.dart';
import 'package:bestie_vibes/pages/login_page.dart';
import 'package:bestie_vibes/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    url: 'https://mgblswupjtikxucobzmp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1nYmxzd3VwanRpa3h1Y29iem1wIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTMyOTIzMzIsImV4cCI6MTk2ODg2ODMzMn0.jfL-mu1rOZPpyf0niDwEnYTY-nEbMjG_GfFuRCDY5Gg',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.light().copyWith(
        primaryColor: Color.fromARGB(255, 125, 194, 247),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Color.fromARGB(255, 142, 126, 242),
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/account': (_) => const AccountPage(),
      },
    );
  }
}
