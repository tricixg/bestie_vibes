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
  Future<List<Outing>> getGroupOutings(BigInt groupId) async {
    final response = await supabase
        .from('outings')
        .select()
        .eq('group_id', groupId)
        .execute();
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
  Future<Outing?> createOuting(BigInt groupId) async {
    final response =
        await supabase.from('outings').insert({'group_id': groupId}).execute();
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
  Future<Outing?> updateOutingActivity(
      BigInt outingId, BigInt newActivity) async {
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

  // for users to update the outing timeblock
  // users must belong to the group of that outing (RLS policy)
  // returns updated outing
  Future<Outing?> updateOutingTimeblock(
      BigInt outingId, BigInt newTimeblock) async {
    final response = await supabase
        .from('outings')
        .update({'timeblock_id': newTimeblock})
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
  Future<bool> deleteOuting(BigInt id) async {
    final response =
        await supabase.from('outings').delete().eq('id', id).execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
      return false;
    }
    return true;
  }

  Outing toOuting(Map<String, dynamic> result) {
    return Outing(
      id: result['id'] ?? 'id',
      group_id: result['group_id'] ?? 'group_id',
      activity_id: result['activity_id'] ?? 'activity_id',
      timeblock_id: result['timeblock_id'] ?? 'timeblock_id',
    );
  }
}
