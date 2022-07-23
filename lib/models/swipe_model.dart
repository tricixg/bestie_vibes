import 'package:equatable/equatable.dart';

class Swipe extends Equatable {
  final String outing_id;
  final String profile_id;
  final int activity_id;
  final DateTime createdAt;

  const Swipe({
    required this.outing_id,
    required this.profile_id,
    required this.activity_id,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        outing_id,
        profile_id,
        activity_id,
      ];

  Swipe.fromMap(Map<String, dynamic> map)
      : outing_id = map['outing_id'],
        profile_id = map['profile_id'],
        createdAt = DateTime.parse(map['created_at']),
        activity_id = map['activity_id'];
}
