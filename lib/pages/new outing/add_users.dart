import 'package:bestie_vibes/models/room_model.dart';
import 'package:bestie_vibes/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class addUserPage extends StatefulWidget {
  //static const String routeName = '/newouting';
  
  const addUserPage({Key? key, required this.room}) : super(key: key);
  final Room room;

  // static Route route() {
  //   return MaterialPageRoute(
  //     builder: (_) => addUserPage(),
  //     settings: RouteSettings(name: routeName),
  //   );
  // }

  @override
  _addUserPageState createState() => _addUserPageState();
}

class _addUserPageState extends AuthRequiredState<addUserPage> {
  final _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'ADD USERS',
        ),      
        floatingActionButton: FloatingActionButton.extended(
          // onPressed: () {
          //   Navigator.pushNamed(context, '/swipe');
          // },
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ChatRoomPage(room: widget.room);
              }),
            );  
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
              // ElevatedButton(
              //   onPressed: () {}, 
              //   child: Text('Search'))
              TextButton(
              onPressed: () async {
                final username = _usernameController.text;
                final res = await Supabase.instance.client
                    .from('profiles')
                    .select()
                    .eq('username', username)
                    .single()
                    .execute();
                final data = res.data;
                final insertRes = await Supabase.instance.client
                    .from('room_participants')
                    .insert({
                  'room_id': widget.room.room_id,
                  'profile_id': data['id'],
                }).execute();
                // Navigator.of(context).pop();
              },
              child: const Text('Invite'),
            ),
            ],
          ),
        ));
  }
}
