import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class UserGroupService {
  final BuildContext context;

  UserGroupService(this.context);

  // for group creators/ members to add members to group:
  // MUST be creator/ member (RLS policy)
  // refer to groups service for how to get user id, group id should be stored on the page
  Future<UserGroup?> addGroupMember(String userId, BigInt groupId) async {
    final response = await supabase.from('user_group').insert({
      'user_id': userId,
      'group_id': groupId,
    }).execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return toUserGroup(data[0]);
    }
    return null;
  }

  // for group members to remove other group members:
  // must be a member of group (RLS policy)
  // returns future<true> if deleted, returns future<false> if deletion unsuccessful
  Future<bool> removeGroupMember(String memberId, BigInt groupId) async {
    final response = await supabase
        .from('user_group')
        .delete()
        .eq('user_id', memberId)
        .eq('group_id', groupId)
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
      return false;
    }
    return true;
  }

  // for group members to view group members of a group they belong to:
  // Must be a member of group (RLS policy)
  Future<List<UserGroup>> getGroupMembers(BigInt groupId) async {
    final response = await supabase
        .from('user_group')
        .select()
        .eq('group_id', groupId)
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return data.map((e) => toUserGroup(e)).toList();
    }
    return [];
  }

  UserGroup toUserGroup(Map<String, dynamic> result) {
    return UserGroup(
      id: result['id'] ?? 'id',
      user_id: result['user_id'] ?? 'user_id',
      group_id: result['group_id'] ?? 'group_id',
    );
  }
}
