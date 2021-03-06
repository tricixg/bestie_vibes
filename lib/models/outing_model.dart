import 'package:equatable/equatable.dart';

class Outing extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime? date;
  final String room_id;
  final int? activity_id;
  final String name;
  final String creator_id;

  const Outing({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.date,
    required this.room_id,
    required this.activity_id,
    required this.creator_id,
  });

  @override
  List<Object?> get props => [
        id,
      ];

  Outing.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        createdAt = DateTime.parse(map['created_at']),
        date = map['date'] != null ? DateTime.parse(map['date']) : null,
        room_id = map['room_id'],
        activity_id = map['activity_id'] ?? null,
        name = map['name'],
        creator_id = map['creator_id'];
}
