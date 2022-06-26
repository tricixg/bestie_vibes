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
    final List<dynamic> data = response.data;
    if (data != null) {
      print('hello');
      return data.map((e) => toActivity(e)).toList();
    }
    print('hi');
    return [];
  }

 Activity toActivity(Map<String, dynamic> result) {
    return Activity(
      id: result['id'] ?? 'id',
      name: result['name'] ?? 'name',
      phone: result['phone'] ?? 'phone',
      opening: result['opening'] ?? 'opening',
      imageUrls: result['image_url'] ?? 'imageUrls',
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
