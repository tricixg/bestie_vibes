import 'package:bestie_vibes/models/room_model.dart';
import 'package:bestie_vibes/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/models.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class RoomPage extends StatefulWidget {
  static const String routeName = '/rooms';
  const RoomPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => RoomPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends SupabaseAuthState<RoomPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final res =
              await Supabase.instance.client.rpc('create_room').execute();
          final data = res.data;
          final error = res.error;
          if (error != null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(error.message)));
            return;
          }
          final room = Room.fromMap(data);

          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return ChatRoomPage(room: room);
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: () {
      //   //   Navigator.pushNamed(context, '/newouting');
      //   // },
      //   backgroundColor: Color(0xFFFD6974),
      //   child: const Icon(Icons.add),
      // ),
      appBar: CustomAppBar(
        title: 'GROUPS',
      ),
      body: StreamBuilder<List<Room>>(
          stream: Supabase.instance.client
              .from('rooms')
              .stream(['room_id'])
              .order('created_at')
              .execute()
              .map((maps) => maps.map(Room.fromMap).toList()),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
                // Text('loading...'),
              );
            }
            final rooms = snapshot.data!;
            if (rooms.isEmpty) {
              return const Center(
                  child: Text('Create a group using the "+" button',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15)));
            }
            return ListView.builder(
            itemCount: rooms.length,
            itemBuilder: (context, index) {
              final room = rooms[index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return ChatRoomPage(room: room);
                    }),
                  );
                },
                title: Text(room.name),
              );
            },
          );
          }),
    );
  }
  

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onAuthenticated(Session session) {
    // TODO: implement onAuthenticated
  }

  @override
  void onErrorAuthenticating(String message) {
    // TODO: implement onErrorAuthenticating
  }

  @override
  void onPasswordRecovery(Session session) {
    // TODO: implement onPasswordRecovery
  }

  @override
  void onUnauthenticated() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false);
  }
}
