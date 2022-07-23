import 'package:bestie_vibes/models/profile_model.dart';
import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class ProfilesService {
  final BuildContext context;

  ProfilesService(this.context);

  // for profiles to view all public profiles:
  Future<List<Profile>> getProfiles() async {
    final response = await supabase.from('profiles').select().execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return data.map((e) => toProfile(e)).toList();
    }
    return [];
  }

  // for profiles to fetch a profile by username (search for a username)
  // returns profile if exists, otherwise return null
  Future<Profile?> getProfile(String username) async {
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
      return toProfile(data[0]);
    }
    return null;
  }

  Profile toProfile(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] ?? '',
      username: map['username'] ?? 'No Username',
      avatar_url: map['avatar_url'],
      favouritecolour: map['favouritecolour'],
    );
  }
}
