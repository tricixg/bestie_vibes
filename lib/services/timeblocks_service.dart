import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class TimeblocksService {
  final BuildContext context;

  TimeblocksService(this.context);

  // view all timeblocks (2022-2026)
  Future<List<Timeblock>> getTimeblocks() async {
    final response = await supabase.from('timeblocks').select().execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return data.map((e) => toTimeblock(e)).toList();
    }
    return [];
  }

  // TODO: Return all timeblocks between 2 given days

  // TODO: Return timeblocks of 1 week from a given day

  // TODO: Return timeblocks of 1 week after today using now()

  Timeblock toTimeblock(Map<String, dynamic> result) {
    return Timeblock(
      id: result['id'] ?? 'id',
      date: result['date'] ?? 'date',
      time: result['time'] ?? 'time',
    );
  }
}
