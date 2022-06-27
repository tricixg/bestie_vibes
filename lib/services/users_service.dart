import 'package:bestie_vibes/models/userr_model.dart';
import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class UsersService {
  final BuildContext context;

  UsersService(this.context);

  // for users to view all public profiles:
  Future<List<Userr>> getUsers() async {
    final response = await supabase.from('profiles').select().execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return data.map((e) => toUser(e)).toList();
    }
    return [];
  }


  // for users to fetch a user by username (search for a username)
  // returns user if exists, otherwise return null
  Future<Userr?> getUser(String username) async {
    final response = await supabase
        .from('profiles')
        .select()
        .eq('username', username)
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return toUser(data[0]);
    }
    return null;
  }


  Userr toUser(Map<String, dynamic> result) {
    return Userr(
      id: result['id'] ?? 'id',
      username: result['username'] ?? 'username',
      avatar_url: result['avatar_url'] ?? 'avatar_url',
      favouritecolour: result['favouritecolour'] ?? 'favouritecolour',
    );
  }
}
