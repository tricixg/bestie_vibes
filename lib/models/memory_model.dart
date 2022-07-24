import 'package:equatable/equatable.dart';

class Memory extends Equatable {
  final String id;
  final String profile_id;
  final String? photo_url;
  final String outing_id;

  const Memory({
    required this.id,
    required this.profile_id,
    required this.photo_url,
    required this.outing_id,
  });

  @override
  List<Object?> get props => [
        id,
      ];

  Memory.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        profile_id = map['profile_id'] ?? '',
        photo_url = map['photo_url'] ?? '',
        outing_id = map['outing_id'];
}
