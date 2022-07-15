import 'package:bestie_vibes/models/room_model.dart';
import 'package:bestie_vibes/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class newGroupTitle extends StatefulWidget {
  //static const String routeName = '/newouting';
  
  const newGroupTitle({Key? key, required this.room}) : super(key: key);
  final Room room;

  // static Route route() {
  //   return MaterialPageRoute(
  //     builder: (_) => newGroupTitle(),
  //     settings: RouteSettings(name: routeName),
  //   );
  // }

  @override
  _newGroupTitleState createState() => _newGroupTitleState();
}

class _newGroupTitleState extends AuthRequiredState<newGroupTitle> {
  final _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'GROUP NAME',
        ),      
        floatingActionButton: FloatingActionButton.extended(
          // onPressed: () {
          //   Navigator.pushNamed(context, '/swipe');
          // },
          onPressed: () async {
            final res = await Supabase.instance.client
              .from('rooms')
              .update({
                'name': _titleController.text,
              })
              .eq('room_id', widget.room.room_id)
              .execute();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return newAddUserPage(room: widget.room);
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
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Group Name'),
              ),
              // ElevatedButton(
              //   onPressed: () {}, 
              //   child: Text('Search'))
            // TextButton(
            //     onPressed: () async {
            //       final res = await Supabase.instance.client
            //           .from('rooms')
            //           .update({
            //             'name': _titleController.text,
            //           })
            //           .eq('room_id', widget.room.room_id)
            //           .execute();
            //       //Navigator.of(context).pop();
            //     },
            //     child: const Text('Save'))
            ],
          ),
        ));
  }
}
