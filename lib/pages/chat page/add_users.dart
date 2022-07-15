import 'dart:ffi';

import 'package:bestie_vibes/models/profile_model.dart';
import 'package:bestie_vibes/models/room_model.dart';
import 'package:bestie_vibes/models/room_participants_model.dart';
import 'package:bestie_vibes/pages/pages.dart';
import 'package:bestie_vibes/utils/constants.dart';
import 'package:flutter/cupertino.dart';
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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return ChatRoomPage(room: widget.room);
                }),
              );
            },
          ),
          backgroundColor: Colors.pink[50],
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                'lib/assets/images/main.png',
                height: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'ADD USERS',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
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
                onPressed: () async {
                  final username = _usernameController.text;
                  final res = await Supabase.instance.client
                      .from('profiles')
                      .select()
                      .eq('username', username)
                      .single()
                      .execute();
                  final data = res.data;
                  final error = res.error;
                  if (error != null && res.status != 406) {
                    context.showErrorSnackBar(message: error.message);
                  }
                  if (data != null) {
                    final insertRes = await Supabase.instance.client
                        .from('room_participants')
                        .insert({
                      'room_id': widget.room.room_id,
                      'profile_id': data['id'],
                    }).execute();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return addUserPage(room: widget.room);
                      }),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'User not found',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        content: Text(
                          'Please check the username',
                          style: TextStyle(fontSize: 15),
                        ),
                        actions: [
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  // Navigator.of(context).pop();
                },
                child: const Text('Invite'),
              ),
              Container(
                child: FutureBuilder<int>(
                  future: _noOfUsers(room: widget.room),
                  builder: (ctx, snapshot) {
                    if(snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    int number = snapshot.data!;
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        return Text('${number}' + ' users invited');
                      default:
                        return Text('Loading...');
                    }
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.7,
                child: StreamBuilder<List<RoomPart>>(
                    stream: Supabase.instance.client
                        .from(
                            'room_participants:room_id=eq.${widget.room.room_id}')
                        .stream(['room_id'])
                        .order('created_at')
                        .execute()
                        .map((maps) => maps.map(RoomPart.fromMap).toList()),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                          // Text('loading...'),
                        );
                      }
                      final parts = snapshot.data!;
                      if (parts.isEmpty) {
                        return const Center(
                            child: Text('Add Users',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15)));
                      }

                      return ListView.builder(
                        itemCount: parts.length,
                        itemBuilder: (context, index) {
                          final roompart = parts[index];
                          return roomPartCard(
                            roomPart: roompart,
                            rooms: widget.room,
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

Future<int> _noOfUsers( {required Room room}) async {
  final response = await Supabase.instance.client
      .from('room_participants')
      .select()
      .eq('room_id', room.room_id)
      .execute(count: CountOption.exact);
  final count = response.count;
  return count!.toInt();
}
