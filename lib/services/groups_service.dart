// group members update group details - input group id

import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class GroupsService {
  final BuildContext context;

  GroupsService(this.context);

  // for users to view all of their groups:
  // supabase RLS policies only expose groups the user belongs to
  // returns list of groups
  Future<List<Group>> getGroups() async {
    final response = await supabase.from('groups').select().execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return data.map((e) => toGroup(e)).toList();
    }
    return [];
  }

  // for users to create group: - see comment below on how to get user id
  // returns the created group
  // please store the group id as a property of the group page so it can be inputted into other functions
  Future<Group?> createGroup(String groupName, String userId) async {
    final response = await supabase
        .from('groups')
        .insert({'name': groupName, 'creator_id': userId}).execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return toGroup(data[0]);
    }
    return null;
  }
  /* To get current user id while on the page, override this method from authRequiredState:
  void onAuthenticated(Session session) {
    final user = session.user;
    if (user != null) {
      _userId = user.id;
    }
  } */

  // for users to delete a group:
  // they must be a member of the group (supabase RLS policy)
  // returns future<true> if deleted, returns future<false> if deletion unsuccessful
  Future<bool> deleteGroup(BigInt id) async {
    final response =
        await supabase.from('groups').delete().eq('id', id).execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
      return false;
    }
    return true;
  }

  // for users to update group name:
  // they must be a member of the group (supabase RLS policy)
  // returns the updated group
  Future<Group?> updateGroup(BigInt id, String newName) async {
    final response = await supabase
        .from('groups')
        .update({'name': newName})
        .eq('id', id)
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return toGroup(data[0]);
    }
    return null;
  }

  Group toGroup(Map<String, dynamic> result) {
    return Group(
      id: result['id'] ?? 'id',
      name: result['name'] ?? 'name',
      creator_id: result['creator_id'] ?? 'creator_id',
      createdAt: result['created_at']
    );
  }
}
