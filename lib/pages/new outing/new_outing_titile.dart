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

  const newOutingTitle({Key? key, required this.outing}) : super(key: key);
  final Outing outing;

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
                  .from('outings')
                  .update({
                    'name': _titleController.text,
                  })
                  .eq('id', widget.outing.id)
                  .execute();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DatePickerPage(outing: widget.outing);
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
