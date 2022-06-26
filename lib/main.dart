import 'package:bestie_vibes/blocs/swipe/swipe_bloc.dart';
import 'package:bestie_vibes/blocs/swipe/swipe_event.dart';
import 'package:bestie_vibes/config/app_router.dart';
import 'package:bestie_vibes/models/outing_model.dart';
import 'package:bestie_vibes/pages/group_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
    return 
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => SwipeBloc()..add(LoadUsersEvent(outings: Outing.outings)))
    ], child:  
    MaterialApp(
      title: 'Bestie Vibes',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: GroupPage.routeName,
      // routes: <String, WidgetBuilder>{
      //   '/': (_) => const SplashPage(),
      //   '/login': (_) => const LoginPage(),
      //   '/account': (_) => const AccountPage(),
      // },
    ),
    );
  }
}
