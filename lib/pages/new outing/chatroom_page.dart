import 'dart:async';


import 'package:bestie_vibes/pages/home/room_page.dart';
import 'package:bestie_vibes/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';
import 'package:bestie_vibes/models/models.dart';

class ChatRoomPage extends StatefulWidget {
  static const String routeName = '/chatroom';
  const ChatRoomPage({Key? key, required this.room}) : super(key: key);

  final Room room;

  // static Route route() {
  //   return MaterialPageRoute(
  //     builder: (_) => ChatRoomPage(roomid: ),
  //     settings: RouteSettings(name: routeName),
  //   );
  // }

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends AuthRequiredState<ChatRoomPage> {
  List<Message>? _messages;
  StreamSubscription<List<Message>>? _messagesListener;
  Map<String, Profile> _profileCache = {};

  @override
  void initState() {
    _messagesListener = Supabase.instance.client
        .from('messages:room_id=eq.${widget.room.room_id}')
        .stream(['id'])
        .order('created_at')
        .execute()
        .map((maps) => maps.map(Message.fromMap).toList())
        .listen((messages) {
          setState(() {
            _messages = messages;
          });
          for (final message in messages) {
            _fetchProfile(message.profileId);
          }
        });
    super.initState();
  }

  Future<void> _fetchProfile(String userId) async {
    if (_profileCache.containsKey(userId)) {
      return;
    }
    final res = await Supabase.instance.client
        .from('profiles')
        .select()
        .eq('id', userId)
        .single()
        .execute();
    final data = res.data;
    if (data != null) {
      setState(() {
        _profileCache[userId] = Profile.fromMap(data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/swipe');
          },
          backgroundColor: Color(0xFFFD6974),
          child: const Icon(Icons.add),
        ),
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
              Expanded(
                child: Image.asset(
                  'lib/assets/images/main.png',
                  height: 50,
                ),
              ),
              Expanded(
                  flex: 2,
                  child: 
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return EditTitleDialog(
                              room: widget.room,
                            );
                          });
                    },
                    child: Text(
                      '${widget.room.name}',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return addUserPage(room: widget.room);
                  }),
                );
              }, 
              icon: Icon(CupertinoIcons.person_2_fill, color: Colors.pink[200]),
              // label: Text('Add User'),
               
                // onPressed: () {
                //   showDialog(
                //       context: context,
                //       builder: (context) {
                //         return InviteDialog(roomId: widget.room.room_id);
                //       });
                // },
                //child: const Text('Invite')
                ),
          ],
        ),
        body: _messagesList());
  }

  Widget _messagesList() {
    if (_messages == null) {
      return const Center(
        child: Text('Loading...'),
      );
    }
    if (_messages!.isEmpty) {
      return const Center(
        child: Text('No one has started an outing yet...'),
      );
    }
    final userId = Supabase.instance.client.auth.user()?.id;

    return ListView.builder(
      itemCount: _messages?.length,
      itemBuilder: (context, index) {
        final message = _messages![index];
        return Align(
          alignment: userId == message.profileId
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: chatBubble(
              userId: userId,
              message: message,
              profileCache: _profileCache,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _messagesListener?.cancel();
    super.dispose();
  }
}

class chatBubble extends StatelessWidget {
  const chatBubble({
    Key? key,
    required this.userId,
    required this.message,
    required this.profileCache,

  }) : super(key: key);

  final String? userId;
  final Message message;
  final Map<String, Profile> profileCache;


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      color: userId == message.profileId ? Colors.grey[300] : Colors.blue[200],
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileCache[message.profileId]?.username ?? 'loading...',
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            Text(
              message.content,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
  }


