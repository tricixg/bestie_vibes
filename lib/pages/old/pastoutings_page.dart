// import 'package:bestie_vibes/models/room_model.dart';
// import 'package:bestie_vibes/pages/new%20group/new_group_title.dart';
// import 'package:bestie_vibes/pages/pages.dart';
// import 'package:bestie_vibes/widgets/outing_card.dart';
// import 'package:bestie_vibes/widgets/room_card.dart';
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import '../../models/models.dart';
// import '/widgets/widgets.dart';
// import 'package:bestie_vibes/components/auth_required_state.dart';

// class PastOutingsPage extends StatefulWidget {
//   static const String routeName = '/pastoutings';
//   const PastOutingsPage({Key? key}) : super(key: key);

//   // static Route route() {
//   //   return MaterialPageRoute(
//   //     builder: (_) => PastOutingsPage(),
//   //     settings: RouteSettings(name: routeName),
//   //   );
//   // }

//   @override
//   _PastOutingsPageState createState() => _PastOutingsPageState();
// }

// class _PastOutingsPageState extends SupabaseAuthState<PastOutingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () async {
//       //     final res =
//       //         await Supabase.instance.client.rpc('create_room').execute();
//       //     final data = res.data;
//       //     final error = res.error;
//       //     if (error != null) {
//       //       ScaffoldMessenger.of(context)
//       //           .showSnackBar(SnackBar(content: Text(error.message)));
//       //       return;
//       //     }
//       //     final room = Room.fromMap(data);

//       //     Navigator.of(context).push(
//       //       MaterialPageRoute(builder: (context) {
//       //         return newGroupTitle(room: room);
//       //       }),
//       //     );
//       //   },
//       //   child: const Icon(Icons.add),
//       // ),

//       appBar: CustomAppBar(
//         title: 'OUTINGS',
//       ),
//       body: StreamBuilder<List<Outing>>(
//           stream: Supabase.instance.client
//               .from('outings')
//               .stream(['id'])
//               .order('created_at')
//               .execute()
//               .map((maps) => maps.map(Outing.fromMap).toList()),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(),
//                 // Text('loading...'),
//               );
//             }
//             final rooms = snapshot.data!;
//             if (rooms.isEmpty) {
//               return const Center(
//                   child: Text('Create a group using the "+" button',
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 0, 0, 0), fontSize: 15)));
//             }
//             return ListView.builder(
//               itemCount: rooms.length,
//               itemBuilder: (context, index) {
//                 final room = rooms[index];
//                 return outingCard(room: room);
//                 // return ListTile(
//                 //   onTap: () {
//                 //     Navigator.of(context).push(
//                 //       MaterialPageRoute(builder: (context) {
//                 //         return ChatRoomPage(room: room);
//                 //       }),
//                 //     );
//                 //   },
//                 //   title: Text(room.name),
//                 // );
//               },
//             );
//           }),
//     );
//   }


//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   void onAuthenticated(Session session) {
//     // TODO: implement onAuthenticated
//   }

//   @override
//   void onErrorAuthenticating(String message) {
//     // TODO: implement onErrorAuthenticating
//   }

//   @override
//   void onPasswordRecovery(Session session) {
//     // TODO: implement onPasswordRecovery
//   }

//   @override
//   void onUnauthenticated() {
//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => const LoginPage()),
//         (route) => false);
//   }
// }
