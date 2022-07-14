import 'package:flutter/cupertino.dart';
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
      title: const Text('Change Group Name'),
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _titleController,
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  final res = await Supabase.instance.client
                      .from('rooms')
                      .update({
                        'name': _titleController.text,
                      })
                      .eq('room_id', room.room_id)
                      .execute();
                  Navigator.of(context).pop();
                },
                child: const Text('Save'))
          ],
        ),
      ],
    );
  }
}
