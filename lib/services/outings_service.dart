import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class OutingsService {
  final BuildContext context;

  OutingsService(this.context);

  // for users to view all their past outings:
  // supabase RLS policies only expose user's own outings
  // returns list of outings
  Future<List<Outing>> getOutings() async {
    final response = await supabase.from('outings').select().execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return data.map((e) => toOuting(e)).toList();
    }
    return [];
  }

  // for users to view outings of a group
  // users must belong to that group
  // returns list of outings
  // group id should be stored in the group page to be used as input arg
  Future<List<Outing>> getRoomOutings(String roomId) async {
    final response =
        await supabase.from('outings').select().eq('room_id', roomId).execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return data.map((e) => toOuting(e)).toList();
    }
    return [];
  }

  // for users to create an outing for their group
  // this is separate from adding anyone to the group (see user_group_service)
  // users must belong to that group
  // returns created outing
  // PLEASE put outing id somewhere on the outing page to be inputted into other functions
  Future<Outing?> createOuting(String roomId) async {
    final response =
        await supabase.from('outings').insert({'room_id': roomId}).execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return toOuting(data[0]);
    }
    return null;
  }

  // for users to update the outing activity
  // users must belong to the group of that outing (RLS policy)
  // returns updated outing
  Future<Outing?> updateOutingActivity(String outingId, int newActivity) async {
    final response = await supabase
        .from('outings')
        .update({'activity_id': newActivity})
        .eq('id', outingId)
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return toOuting(data[0]);
    }
    return null;
  }

  // for users to update the outing date
  // users must belong to the group of that outing (RLS policy)
  // returns updated outing
  Future<Outing?> updateOutingDate(String outingId, DateTime newDate) async {
    // i think need to remove time from datetime object by formatting
    final response = await supabase
        .from('outings')
        .update({'date': newDate})
        .eq('id', outingId)
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return toOuting(data[0]);
    }
    return null;
  }

  // for users to delete outing:
  // users must be member of the outing's group
  // returns boolean - true = deleted, false = unsuccessful
  Future<bool> deleteOuting(String id) async {
    final response =
        await supabase.from('outings').delete().eq('id', id).execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
      return false;
    }
    return true;
  }

  Outing toOuting(Map<String, dynamic> map) {
    return Outing(
      id: map['id'],
      createdAt: DateTime.parse(map['created_at']),
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      room_id: map['room_id'],
      activity_id: map['activity_id'] ?? null,
    );
  }
}
