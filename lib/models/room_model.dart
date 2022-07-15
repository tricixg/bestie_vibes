class Room {
  final String room_id;
  final String name;
  final DateTime createdAt;

  Room({
    required this.room_id,
    required this.name,
    required this.createdAt,
  });

  Room.fromMap(Map<String, dynamic> map)
      : room_id = map['room_id'],
        name = map['name'] ?? 'Untitled',
        createdAt = DateTime.parse(map['created_at']);
}