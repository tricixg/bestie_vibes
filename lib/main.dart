
import 'package:bestie_vibes/config/app_router.dart';
import 'package:bestie_vibes/models/outing_model.dart';
import 'package:bestie_vibes/pages/home/group_page.dart';
import 'package:bestie_vibes/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/theme.dart';
import 'pages/pages.dart';

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
        debugShowCheckedModeBanner: false,
        title: 'Bestie Vibes',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: LoginPage.routeName,
    );
  }
}
