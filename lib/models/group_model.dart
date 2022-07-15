
import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final BigInt id;
  final String name;
  final DateTime createdAt;
  final String creator_id;

  const Group({
    required this.id,
    required this.name,
    required this.creator_id,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
      ];

  Group.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'] ?? 'Untitled',
        creator_id = map['creator_id'] ?? 'Untitled',
        createdAt = DateTime.parse(map['created_at']);
}
