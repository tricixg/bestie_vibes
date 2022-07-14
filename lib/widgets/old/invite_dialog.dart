// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class InviteDialog extends StatefulWidget {
//   const InviteDialog({
//     Key? key,
//     required this.roomId,
//   }) : super(key: key);

//   final String roomId;

//   @override
//   State<InviteDialog> createState() => _InviteDialogState();
// }

// class _InviteDialogState extends State<InviteDialog> {
//   final _textController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       title: const Text('Invite a user'),
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: TextFormField(
//                 controller: _textController,
//               ),
//             ),
//             TextButton(
//               onPressed: () async {
//                 final username = _textController.text;
//                 final res = await Supabase.instance.client
//                     .from('profiles')
//                     .select()
//                     .eq('username', username)
//                     .single()
//                     .execute();
//                 final data = res.data;
//                 final insertRes = await Supabase.instance.client
//                     .from('room_participants')
//                     .insert({
//                   'room_id': widget.roomId,
//                   'profile_id': data['id'],
//                 }).execute();
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Invite'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }