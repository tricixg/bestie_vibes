import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class AvailabilitiesService {
  final BuildContext context;

  AvailabilitiesService(this.context);

  // for users to state their availability for an outing for a timeblock:
  // refer to groups_service file to see comment on how to get user id
  // returns the created availability record
  Future<Availability?> stateAvailability(
      String userId, BigInt timeblockId, BigInt outingId) async {
    final response = await supabase.from('availabilities').insert({
      'user_id': userId,
      'timeblock_id': timeblockId,
      'outing_id': outingId
    }).execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return toAvailability(data[0]);
    }
    return null;
  }

  // for users to view member availabilities for an outing:
  // supabase RLS policies only allow if member is part of the group for that outing
  // returns list of availabilities
  Future<List<Availability>> getOutingAvailabilities(BigInt outingId) async {
    final response = await supabase
        .from('availabilities')
        .select()
        .eq('outing_id', outingId)
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return data.map((e) => toAvailability(e)).toList();
    }
    return [];
  }

// TODO: Get timeblocks where everyone is available for particular outing

  Availability toAvailability(Map<String, dynamic> result) {
    return Availability(
      id: result['id'] ?? 'id',
      user_id: result['user_id'] ?? 'user_id',
      timeblock_id: result['timeblock_id'] ?? 'timeblock_id',
      outing_id: result['outing_id'] ?? 'outing_id',
    );
  }
}
