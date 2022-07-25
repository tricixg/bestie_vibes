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

class newAddUserPage extends StatefulWidget {
  //static const String routeName = '/newouting';

  const newAddUserPage({Key? key, required this.room}) : super(key: key);
  final Room room;

  // static Route route() {
  //   return MaterialPageRoute(
  //     builder: (_) => newAddUserPage(),
  //     settings: RouteSettings(name: routeName),
  //   );
  // }

  @override
  _newAddUserPageState createState() => _newAddUserPageState();
}

class _newAddUserPageState extends AuthRequiredState<newAddUserPage> {
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
                  return HomePage();
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
                  return HomePage();
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
                  if (res.data == null) {
                   showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                              child: const Text('User not found',
                                style: TextStyle(color: Colors.red, fontSize: 20)),
                            ),
                          );
                        });
                  } else {
                    final insertRes = await Supabase.instance.client
                        .from('room_participants')
                        .insert({
                      'room_id': widget.room.id,
                      'profile_id': data['id'],
                    }).execute();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return newAddUserPage(room: widget.room);
                      }),
                    );
                  }
                  // Navigator.of(context).pop();
                },
                child: const Text('Invite'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.4,
                child: StreamBuilder<List<RoomPart>>(
                    stream: Supabase.instance.client
                        .from('room_participants:room_id=eq.${widget.room.id}')
                        .stream(['room_id'])
                        .order('created_at')
                        .execute()
                        .map((maps) => maps.map(RoomPart.fromMap).toList()),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CupertinoActivityIndicator(),
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
