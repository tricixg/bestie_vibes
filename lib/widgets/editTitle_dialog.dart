import 'package:bestie_vibes/pages/home/home_page.dart';
import 'package:bestie_vibes/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/models.dart';

class EditTitleDialog extends StatelessWidget {
  EditTitleDialog({
    Key? key,
    required this.room,
  }) : super(key: key);

  final Room room;
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Change Group Name', style: TextStyle(fontSize: 16)),
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: TextFormField(
                  controller: _titleController,
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  if (_titleController.text.isEmpty) {
                    _titleController.text = 'Untitled';
                  }
                  final res = await Supabase.instance.client
                      .from('rooms')
                      .update({
                        'name': _titleController.text,
                      })
                      .eq('id', room.id)
                      .execute();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }),
                  );
                },
                child: const Text('Save'))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: ElevatedButton.icon(
            icon: Icon(Icons.delete),
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return deleteGroupDialog(
                      room: room,
                    );
                  });
            },
            label: Text('Delete Group'),
          ),
        )
      ],
    );
  }
}
