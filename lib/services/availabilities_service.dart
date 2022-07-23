import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class AvailabilitiesService {
  final BuildContext context;

  AvailabilitiesService(this.context);

  // for profiles to state their availability for an outing for a timeblock:
  // refer to groups_service file to see comment on how to get profile id
  // returns the created availability record
  Future<Availability?> stateAvailability(
      String profileId, String outingId, DateTime date) async {
    // i think need to remove time from DateTime object
    final response = await supabase.from('availabilities').insert({
      'profile_id': profileId,
      'date': date,
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

  // for profiles to view member availabilities for an outing:
  // supabase RLS policies only allow if member is part of the group for that outing
  // returns list of availabilities
  Future<List<Availability>> getOutingAvailabilities(String outingId) async {
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

  Availability toAvailability(Map<String, dynamic> map) {
    return Availability(
      date: DateTime.parse(map['date']),
      profile_id: map['name'],
      createdAt: DateTime.parse(map['created_at']),
      outing_id: map['outing_id'],
    );
  }
}
