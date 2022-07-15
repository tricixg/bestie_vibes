class RoomPart {
  final String room_id;
  final String profile_id;
  final DateTime createdAt;

  RoomPart({
    required this.room_id,
    required this.profile_id,
    required this.createdAt,
  });

  RoomPart.fromMap(Map<String, dynamic> map)
      : room_id = map['room_id'] ?? '',
        profile_id = map['profile_id'] ?? '',
        createdAt = DateTime.parse(map['created_at']?? '');
}