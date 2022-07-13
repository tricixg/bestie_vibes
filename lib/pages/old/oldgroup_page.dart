// import 'package:flutter/material.dart';
// import '/widgets/widgets.dart';
// import 'package:bestie_vibes/components/auth_required_state.dart';
// import 'package:bestie_vibes/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:bestie_vibes/pages/pages.dart';
// import 'package:bestie_vibes/models/models.dart';
// //dummy
// class GroupPage extends StatefulWidget {
//   static const String routeName = '/group';
//   const GroupPage({Key? key}) : super(key: key);

//   static Route route() {
//     return MaterialPageRoute(
//       builder: (_) => GroupPage(),
//       settings: RouteSettings(name: routeName),
//     );
//   }

//   @override
//   _GroupPageState createState() => _GroupPageState();
// }

// class _GroupPageState extends AuthRequiredState<GroupPage> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/newouting');
//         },
//         backgroundColor: Color(0xFFFD6974),
//         child: const Icon(Icons.add),
//       ),
//       body: Column(
//       children: [
//         CustomAppBar(title: 'OUTINGS'),
//         Expanded(

//               child: ListView.builder(
//                 itemCount: chats.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final Message chat = chats[index];
//                   return GestureDetector(
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => ChatScreen(
//                           user: chat.sender,
//                         ),
//                       ),
//                     ),
//                     child: Container(
//                       margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                       decoration: BoxDecoration(
//                         color: chat.unread ? Color.fromARGB(255, 255, 185, 191) : Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(20.0),
//                           bottomRight: Radius.circular(20.0),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               CircleAvatar(
//                                 radius: 35.0,
//                                 backgroundImage: NetworkImage(chat.sender.imageUrl[0]),
//                               ),
//                               SizedBox(width: 8.0),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Text(
//                                     chat.sender.name,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14.0,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(height: 5.0),
//                                   Container(
//                                     width: MediaQuery.of(context).size.width * 0.45,
//                                     child: Text(
//                                       chat.text,
//                                       style: TextStyle(
//                                         color: Colors.blueGrey,
//                                         fontSize: 14.0,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: <Widget>[
//                               Text(
//                                 chat.time,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(height: 5.0),
//                               chat.unread
//                                   ? Container(
//                                       width: 40.0,
//                                       height: 20.0,
//                                       decoration: BoxDecoration(
//                                         color: Theme.of(context).primaryColor,
//                                         borderRadius: BorderRadius.circular(30.0),
//                                       ),
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         'NEW',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 12.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     )
//                                   : Text(''),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
          
//         ),
//       ],
//     )
//     );
//   }
// }
