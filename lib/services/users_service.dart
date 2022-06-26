import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class UsersService {
  final BuildContext context;

  UsersService(this.context);

  // for users to view all public profiles:
  Future<List<User>> getUsers() async {
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

  User toUser(Map<String, dynamic> result) {
    return User(
      id: result['id'] ?? 'id',
      username: result['username'] ?? 'username',
      avatar_url: result['avatar_url'] ?? 'avatar_url',
      favouritecolour: result['favouritecolour'] ?? 'favouritecolour',
    );
  }
}
