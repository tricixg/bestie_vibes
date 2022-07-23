import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class SwipesService {
  final BuildContext context;

  SwipesService(this.context);

  // for users to swipe on an activity for an outing:
  // users can only insert their OWN swipes and for outings of groups they belong to
  // get activityid from card, get outingid from page - store these in the page!
  // returns created swipe record
  Future<Swipe?> createSwipe(
      String profileId, int activityId, String outingId) async {
    final response = await supabase.from('swipes').insert({
      'profile_id': profileId,
      'activity_id': activityId,
      'outing_id': outingId
    }).execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return toSwipe(data[0]);
    }
    return null;
  }

  // for users to view swipes for an outing
  // they must belong to group of that outing
  // get outingId from page
  Future<List<Swipe>> getOutingSwipes(String outingId) async {
    final response = await supabase
        .from('swipes')
        .select()
        .eq('outing_id', outingId)
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return data.map((e) => toSwipe(e)).toList();
    }
    return [];
  }

  // TODO: return activity for outing with highest no. of swipes

  Swipe toSwipe(Map<String, dynamic> map) {
    return Swipe(
      outing_id: map['outing_id'],
      profile_id: map['profile_id'],
      createdAt: DateTime.parse(map['created_at']),
      activity_id: map['activity_id'],
    );
  }
}
