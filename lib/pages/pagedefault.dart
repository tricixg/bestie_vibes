import 'package:flutter/material.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class PageDefault extends StatefulWidget {
  static const String routeName = '/default';
  const PageDefault({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => PageDefault(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _PageDefaultState createState() => _PageDefaultState();
}

class _PageDefaultState extends AuthRequiredState<PageDefault> {
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
