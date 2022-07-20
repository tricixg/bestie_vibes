import 'package:bestie_vibes/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/models.dart';

class deleteGroupDialog extends StatelessWidget {
  const deleteGroupDialog({
    Key? key,
    required this.room,
  }) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Delete Group',
          style: TextStyle(color: Colors.red, fontSize: 20)),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('Are you sure you want to delete this group?',
              style: TextStyle(
                fontSize: 15.0,
              )),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () async {
                  final res = await Supabase.instance.client
                      .from('rooms')
                      .delete()
                      .eq('id', room.id)
                      .execute();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }),
                  );
                },
                child: const Text('Delete'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
