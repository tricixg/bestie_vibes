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
      return data.map((e) => toActivity(e)).toList();
    }
    return [];
  }

  Activity toActivity(Map<String, dynamic> map) {
    return Activity(
      id: map['id'] ?? 0,
      name: map['name'] ?? 'Name',
      phone: map['phone'] ?? 'Phone',
      opening: map['opening'] ?? 'Opening',
      imageUrls: map['image_url'] ?? 'Image Url',
      tag: map['tag'] ?? 'Tag',
      description: map['description'] ?? 'Description',
      address: map['address'] ?? 'Address',
      price: map['price'] ?? 0,
      type: map['type'] ?? 'Type',
      postal: map['postal'] ?? 'Postal',
      website: map['website'] ?? 'Website',
    );
  }
}
