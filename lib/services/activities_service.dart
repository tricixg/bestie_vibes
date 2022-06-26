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
      id: result['id'] ?? 'id',
      name: result['name'] ?? 'name',
      phone: result['phone'] ?? 'phone',
      opening: result['opening'] ?? 'opening',
      image_url: result['image_url'] ?? 'image_url',
      tag: result['tag'] ?? 'tag',
      description: result['description'] ?? 'description',
      address: result['address'] ?? 'address',
      price: result['price'] ?? 'price',
      type: result['type'] ?? 'type',
      postal: result['postal'] ?? 'postal',
      website: result['website'] ?? 'website',
    );
  }
}
