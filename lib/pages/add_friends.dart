// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import '/widgets/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bestie_vibes/components/auth_required_state.dart';

// class AddFriends extends StatefulWidget {
//   static const String routeName = '/addfriends';
//   const AddFriends({Key? key}) : super(key: key);

//   static Route route() {
//     return MaterialPageRoute(
//       builder: (_) => AddFriends(),
//       settings: RouteSettings(name: routeName),
//     );
//   }

//   @override
//   _AddFriendsState createState() => _AddFriendsState();
// }

// class _AddFriendsState extends AuthRequiredState<AddFriends> {
//   final _usernameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'ADD FRIENDS',
//       ),
//       body:Padding(
//         padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
//         child: Column(
//             children: [
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: const InputDecoration(labelText: 'User Name'),
//               ),
//               ElevatedButton(
//                 onPressed: () {}, 
//                 child: Text('Search')),
 
//             ],
//           ),
//       )
//     );
//   }
// }
