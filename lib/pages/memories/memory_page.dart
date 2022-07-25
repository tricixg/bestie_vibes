
import 'package:bestie_vibes/components/photo.dart';
import 'package:bestie_vibes/models/reflections_model.dart';
import 'package:bestie_vibes/pages/memories/activity_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../components/auth_required_state.dart';
import '../../models/outing_model.dart';
import '../../utils/constants.dart';
import '../../widgets/widgets.dart';

class MemoryPage extends StatefulWidget {
  const MemoryPage({Key? key, required this.outing}) : super(key: key);
  final Outing outing;

  @override
  _MemoryPageState createState() => _MemoryPageState();
}

class _MemoryPageState extends AuthRequiredState<MemoryPage> {
  final _reflectionController = TextEditingController();
  String? _memoryUrl;
  var _loading = false;

  Future<void> _onUpload(String imageUrl) async {
    final response = await supabase.from('memories').insert({
      'outing_id': widget.outing.id,
      'profile_id': Supabase.instance.client.auth.user()?.id,
      'photo_url': imageUrl,
    }).execute();
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    }
    setState(() {
      _memoryUrl = imageUrl;
    });
    context.showSnackBar(message: 'Updated your memory!');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MEMORY'),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    '${widget.outing.name}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                      '${DateFormat("dd-MM-yyyy").format(widget.outing.date ?? DateTime(0000))}')
                ],
              ),
            ),
            Photo(
              imageUrl: _memoryUrl,
              onUpload: _onUpload,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/9,
              child: StreamBuilder<List<Reflections>>(
                stream: Supabase.instance.client
                    .from('reflections:outing_id=eq.${widget.outing.id}')
                    .stream(['id'])
                    .order('created_at')
                    .execute()
                    .map((maps) => maps.map(Reflections.fromMap).toList()),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                  print(snapshot);

                    return Center(
                      child: 
                      CupertinoActivityIndicator(),
                      // Text('loading...'),
                      
                    );
                  }
                  final comments = snapshot.data!;
                  if (comments.isEmpty) {
                    return const Center(
                        child: Text('Add a Comment',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontSize: 15)));
                  }
                  return ListView.builder(
                    //scrollDirection: Axis.horizontal,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      return ListTile(
                        title: Text(comment.content),
                      );
                    },
                  )
                  ;
                }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _reflectionController,
                decoration: const InputDecoration(
                    labelText: 'How was your day?',
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                   final insertRes = await Supabase.instance.client
                      .from('reflections')
                      .insert({
                    'outing_id': widget.outing.id,
                    'profile_id': Supabase.instance.client.auth.user()?.id,
                    'content' : _reflectionController.text,
                  }).execute();
                   Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return MemoryPage(outing: widget.outing);
                      }),
                    );
                },
                child: Text('save')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return ActivityPage(
                        activityid: widget.outing.activity_id ?? 1,
                      );
                    }),
                  );
                },
                child: Text('View Activity')),
          ]),
    );
  }
 
}
 