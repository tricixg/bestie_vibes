import 'package:flutter/material.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class MemoriesPage extends StatefulWidget {
  static const String routeName = '/memories';
  const MemoriesPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => MemoriesPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _MemoriesPageState createState() => _MemoriesPageState();
}

class _MemoriesPageState extends AuthRequiredState<MemoriesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: CustomAppBar(
          title: 'MEMORIES',
        ),
        body:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'lib/assets/images/main.png',
                  height: 200,
                ),
              ),
              Text('COMING SOON',
              style: Theme.of(context).textTheme.headline2,)
            ],
          ),
        ],
      ),
    );
  }
}
