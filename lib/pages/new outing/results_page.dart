import 'package:bestie_vibes/models/activity_model.dart';
import 'package:flutter/material.dart';
import '/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class ResultsPage extends StatefulWidget {
  static const String routeName = '/results';
  const ResultsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => ResultsPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends AuthRequiredState<ResultsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Results',
      ),
      body: ActivityCard(activity: 
      Activity(
        address: '81 Lorong Chencharu #01-01', 
        description: 'Recreational complex with prawning & fishing ponds, plus a trampoline park & a go-karting track.', 
        id: 1, 
        imageUrls: 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', 
        name: 'Orto', 
        opening: '24 hours', 
        phone: '6257 8858', 
        postal: '769198', 
        price: 2, 
        tag: 'attraction', 
        type: 'hybrid', 
        website: 'https://www.orto.sg/'),)
    );
  }
}
