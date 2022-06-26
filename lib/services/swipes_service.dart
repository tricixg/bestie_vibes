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
      String userId, BigInt activityId, BigInt outingId) async {
    final response = await supabase.from('swipes').insert({
      'user_id': userId,
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
  Future<List<Swipe>> getOutingSwipes(BigInt outingId) async {
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

  Swipe toSwipe(Map<String, dynamic> result) {
    return Swipe(
      id: result['id'] ?? 'id',
      outing_id: result['outing_id'] ?? 'outing_id',
      user_id: result['user_id'] ?? 'user_id',
      activity_id: result['activity_id'] ?? 'activity_id',
    );
  }
}
