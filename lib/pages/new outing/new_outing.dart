import 'package:flutter/material.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class NewOutingPage extends StatefulWidget {
  static const String routeName = '/newouting';
  const NewOutingPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => NewOutingPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _NewOutingPageState createState() => _NewOutingPageState();
}

class _NewOutingPageState extends AuthRequiredState<NewOutingPage> {
  final _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'NEW OUTING',
        ),      
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/swipe');
          },
          backgroundColor: Color(0xFFFD6974),
          label: const Text('DONE'),
          icon: const Icon(Icons.navigate_next)          
        ),
        body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'User Name'),
              ),
              ElevatedButton(
                onPressed: () {}, 
                child: Text('Search'))
            ],
          ),
        ));
  }
}
