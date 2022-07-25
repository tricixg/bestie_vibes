
import 'package:bestie_vibes/components/photo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../components/auth_required_state.dart';
import '../models/outing_model.dart';
import '../utils/constants.dart';
import '../widgets/widgets.dart';

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
      appBar: CustomAppBar(title:'MEMORY'),
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
                    Text('${DateFormat("dd-MM-yyyy").format(widget.outing.date ?? DateTime(0000))}')
               ],
             ),

           ),
          Photo(
            imageUrl: _memoryUrl,
            onUpload: _onUpload,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _reflectionController,
                decoration: const InputDecoration(
                  labelText: 'How was your day?',
                  border: OutlineInputBorder()),
              ),
            ),
          ),
        ]
      ),
    );
  }}
