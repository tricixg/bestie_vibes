import 'package:bestie_vibes/widgets/friend_card.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
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
  bool isVisible = false;

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
            icon: const Icon(Icons.navigate_next)),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'User Name'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                isVisible = !isVisible;
                }), 
              child: Text('Search')
              ),
              
              if (isVisible)
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.4,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return FriendCard(users[index]);
                    },
                    itemCount: users.length,
                  ),
                ),
            ],
          ),
        ));
  }
}

List<User> users = [
  User(
    id: 326332,
    name: 'Test1',
    imageUrl: [
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
    ],
  ),
  User(
    id: 124245,
    name: 'Test2',
    imageUrl: [
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
    ],
  ),
  User(
    id: 328232,
    name: 'Test3',
    imageUrl: [
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
    ],
  ),
];
