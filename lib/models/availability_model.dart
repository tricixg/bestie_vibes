import 'package:equatable/equatable.dart';

class Availability extends Equatable {
  final DateTime date;
  final String profile_id;
  final String outing_id;
  final DateTime createdAt;

  const Availability({
    required this.date,
    required this.profile_id,
    required this.outing_id,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        profile_id,
        outing_id,
        date,
      ];

  Availability.fromMap(Map<String, dynamic> map)
      : date = DateTime.parse(map['date']),
        profile_id = map['name'],
        createdAt = DateTime.parse(map['created_at']),
        outing_id = map['outing_id'];
}
