// import 'package:flutter/material.dart';

// import '/models/models.dart';
// import 'package:bestie_vibes/utils/constants.dart';
// import '../profiles_service.dart';

// class UserGroupService {
//   final BuildContext context;

//   UserGroupService(this.context);

//   // for group creators/ members to add members to group (by user id):
//   // MUST be creator/ member (RLS policy)
//   // refer to groups service for how to get user id, group id should be stored on the page
//   Future<UserGroup?> addGroupMemberById(String userId, BigInt groupId) async {
//     final response = await supabase.from('user_group').insert({
//       'user_id': userId,
//       'group_id': groupId,
//     }).execute();
//     final error = response.error;
//     if (error != null && response.status != 406) {
//       context.showErrorSnackBar(message: error.message);
//     }
//     final data = response.data as List<dynamic>;
//     if (data != null) {
//       return toUserGroup(data[0]);
//     }
//     return null;
//   }

//   // for group creators/ members to add members to group (by username):
//   // MUST be creator/ member (RLS policy)
//   Future<UserGroup?> addGroupMemberByUsername(
//       String username, BigInt groupId) async {
//     // get user from database to use user id field
//     final userResponse = await supabase
//         .from('profiles')
//         .select()
//         .eq('username', username)
//         .execute();
//     final userError = userResponse.error;
//     if (userError != null && userResponse.status != 406) {
//       context.showErrorSnackBar(message: userError.message);
//     }
//     final userData = userResponse.data as List<dynamic>;
//     if (userData == null) {
//       return null;
//     }
//     final user = UsersService(context).toUser(userData[0]);

//     // insert user using obtained id
//     final userGroupResponse = await supabase.from('user_group').insert({
//       'user_id': user.id,
//       'group_id': groupId,
//     }).execute();
//     final userGroupError = userGroupResponse.error;
//     if (userGroupError != null && userGroupResponse.status != 406) {
//       context.showErrorSnackBar(message: userGroupError.message);
//     }
//     final userGroupData = userGroupResponse.data as List<dynamic>;
//     if (userGroupData != null) {
//       return toUserGroup(userGroupData[0]);
//     }
//     return null;
//   }

//   // for users to add multiple users to group at once (by id)
//   Future<List<UserGroup>> addGroupMembersById(
//       List<String> userIds, BigInt groupId) async {
//     var records = [];
//     for (final userId in userIds) {
//       records.add({
//         'user_id': userId,
//         'group_id': groupId,
//       });
//     }
//     final response =
//         await supabase.from('user_group').insert(records).execute();
//     final error = response.error;
//     if (error != null && response.status != 406) {
//       context.showErrorSnackBar(message: error.message);
//     }
//     final data = response.data as List<dynamic>;
//     if (data != null) {
//       return data.map((e) => toUserGroup(e)).toList();
//     }
//     return [];
//   }

//   // for users to add multiple users to group at once (by username)
//   Future<List<UserGroup>> addGroupMembersByUsername(
//       List<String> usernames, BigInt groupId) async {
//     // get list of user ids
//     var userIds = [];
//     for (final username in usernames) {
//       var userResponse = await supabase
//           .from('profiles')
//           .select()
//           .eq('username', username)
//           .execute();
//       var userError = userResponse.error;
//       if (userError != null && userResponse.status != 406) {
//         context.showErrorSnackBar(message: userError.message);
//       }
//       var userData = userResponse.data as List<dynamic>;
//       if (userData == null) {
//         return [];
//       }
//       var user = UsersService(context).toUser(userData[0]);
//       userIds.add(user.id);
//     }

//     // add multiple users to group
//     var records = [];
//     for (final userId in userIds) {
//       records.add({
//         'user_id': userId,
//         'group_id': groupId,
//       });
//     }
//     final response =
//         await supabase.from('user_group').insert(records).execute();
//     final error = response.error;
//     if (error != null && response.status != 406) {
//       context.showErrorSnackBar(message: error.message);
//     }
//     final data = response.data as List<dynamic>;
//     if (data != null) {
//       return data.map((e) => toUserGroup(e)).toList();
//     }
//     return [];
//   }

//   // for group members to remove other group members:
//   // must be a member of group (RLS policy)
//   // returns future<true> if deleted, returns future<false> if deletion unsuccessful
//   Future<bool> removeGroupMember(String memberId, BigInt groupId) async {
//     final response = await supabase
//         .from('user_group')
//         .delete()
//         .eq('user_id', memberId)
//         .eq('group_id', groupId)
//         .execute();
//     final error = response.error;
//     if (error != null && response.status != 406) {
//       context.showErrorSnackBar(message: error.message);
//       return false;
//     }
//     return true;
//   }

//   // for group members to view group members of a group they belong to:
//   // Must be a member of group (RLS policy)
//   Future<List<UserGroup>> getGroupMembers(BigInt groupId) async {
//     final response = await supabase
//         .from('user_group')
//         .select()
//         .eq('group_id', groupId)
//         .execute();
//     final error = response.error;
//     if (error != null && response.status != 406) {
//       context.showErrorSnackBar(message: error.message);
//     }
//     final data = response.data as List<dynamic>;
//     if (data != null) {
//       return data.map((e) => toUserGroup(e)).toList();
//     }
//     return [];
//   }

//   UserGroup toUserGroup(Map<String, dynamic> result) {
//     return UserGroup(
//       id: result['id'] ?? 'id',
//       user_id: result['user_id'] ?? 'user_id',
//       group_id: result['group_id'] ?? 'group_id',
//     );
//   }
// }
