import 'package:bestie_vibes/models/outing_model.dart';
import 'package:bestie_vibes/models/room_model.dart';
import 'package:bestie_vibes/pages/new%20outing/datepicker.dart';
import 'package:bestie_vibes/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class newOutingTitle extends StatefulWidget {
  //static const String routeName = '/newouting';

  const newOutingTitle({Key? key, required this.room}) : super(key: key);
  final Room room;

  // static Route route() {
  //   return MaterialPageRoute(
  //     builder: (_) => newOutingTitle(),
  //     settings: RouteSettings(name: routeName),
  //   );
  // }

  @override
  _newOutingTitleState createState() => _newOutingTitleState();
}

class _newOutingTitleState extends AuthRequiredState<newOutingTitle> {
  final _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'OUTING NAME',
        ),
        floatingActionButton: FloatingActionButton.extended(
            // onPressed: () {
            //   Navigator.pushNamed(context, '/swipe');
            // },
            onPressed: () async {

            final res = await Supabase.instance.client
                .rpc('create_outing', params: {'room_id': '${widget.room.id}', 'name': '${_titleController.text}', 'creator_id': Supabase.instance.client.auth.user()?.id}).execute();
            final data = res.data;
            final error = res.error;
            if (error != null) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(error.message)));
              return;
            }
            final outing = Outing.fromMap(data);
            // final userId = Supabase.instance.client.auth.user()?.id;


            // final insertres = await Supabase.instance.client
            //     .from('outings')
            //     .update({
            //       'creator_id': userId,
            //     })
            //     .eq('id', outing.id)
            //     .execute();

              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DatePickerPage(outing: outing);
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
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Outing Name'),
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
