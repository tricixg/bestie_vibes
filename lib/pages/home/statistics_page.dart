import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class StatisticsPage extends StatefulWidget {
  static const String routeName = '/statistics';
  const StatisticsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => StatisticsPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends AuthRequiredState<StatisticsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'STATISTICS',
      ),
      body: Row(
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
