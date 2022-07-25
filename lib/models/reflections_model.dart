import 'package:equatable/equatable.dart';

class Reflections extends Equatable {
  final int id;
  final String profile_id;
  final String content;
  final String outing_id;
  final DateTime created_at;
 

  const Reflections({
    required this.id,
    required this.profile_id,
    required this.content,
    required this.outing_id,
    required this.created_at,

  });

  @override
  List<Object?> get props => [
        id,
      ];

  Reflections.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        profile_id = map['profile_id'] ?? '',
        content = map['content'] ?? '',
        outing_id = map['outing_id'],
        created_at = DateTime.parse(map['created_at']);
}