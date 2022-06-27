import 'package:flutter/material.dart';
import '/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class SwipePage extends StatefulWidget {
  static const String routeName = '/swipe';
  const SwipePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => SwipePage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends AuthRequiredState<SwipePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SWIPE',
      ),
      body: Text('hello')
    );
  }
}
