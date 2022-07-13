import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditTitleDialog extends StatelessWidget {
  EditTitleDialog({
    Key? key,
    required this.roomId,
  }) : super(key: key);

  final String roomId;
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Change Room Title'),
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _titleController,
              ),
            ),
            TextButton(
                onPressed: () async {
                  final res = await Supabase.instance.client
                      .from('rooms')
                      .update({
                        'name': _titleController.text,
                      })
                      .eq('room_id', roomId)
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
