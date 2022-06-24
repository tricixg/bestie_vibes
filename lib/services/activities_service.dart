import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:bestie_vibes/utils/constants.dart';

class ActivitiesService {
  final BuildContext context;

  ActivitiesService(this.context);

  Future<List<Activity>> getActivities() async {
    final response = await supabase.from('activities').select().execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final data = response.data as List<dynamic>;
    if (data != null) {
      return data.map((e) => toActivity(e)).toList();
    }
    return [];
  }

  Activity toActivity(Map<String, dynamic> result) {
    return Activity(
      id: result['id'],
      name: result['name'],
      phone: result['phone'],
      opening: result['opening'],
      imageUrls: result['imageUrls'],
      tag: result['tag'],
      description: result['description'],
      address: result['address'],
      price: result['price'],
      type: result['type'],
      postal: result['postal'],
      website: result['website'],
    );
  }
}
