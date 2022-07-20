import 'package:bestie_vibes/models/room_participants_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/models.dart';
import '../pages/pages.dart';

class roomPartCard extends StatelessWidget {
  const roomPartCard({Key? key, required this.roomPart, required this.rooms})
      : super(key: key);

  final RoomPart roomPart;
  final Room rooms;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile>(
      future: _fetchProfile(roomPart),
      builder: (ctx, snapshot) {
        if (snapshot.data == null) {
          return Text('Loading...');
        } else {
          Profile profile = snapshot.data!;

          switch (snapshot.connectionState) {
            case ConnectionState.done:
            
              return ListTile(
                title: Text(profile.username),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    final res = await Supabase.instance.client
                        .from('room_participants')
                        .delete()
                        .eq('room_id', roomPart.room_id)
                        .eq('profile_id', profile.id)
                        .execute();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return addUserPage(room: rooms);
                      }),
                    );
                  },
                ),
              );
            default:
              return Text('loading...');
          }
        }
      },
    );
  }

  Future<Profile> _fetchProfile(RoomPart roompart) async {
    final res = await Supabase.instance.client
        .from('profiles')
        .select()
        .eq('id', roompart.profile_id)
        .single()
        .execute();
    final data = res.data;
    if (data == null) {
      return Profile(
          id: 'id',
          username: 'username',
          avatar_url: 'avatar_url',
          favouritecolour: 'favouritecolour');
    }
    return Profile.fromMap(data);
  }
}
