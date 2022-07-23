import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String username;
  final String? avatar_url;
  final String? favouritecolour;

  const Profile({
    required this.id,
    required this.username,
    required this.avatar_url,
    required this.favouritecolour,
  });

  @override
  List<Object?> get props => [
        id,
      ];

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        username = map['username'] ?? 'No Username',
        avatar_url = map['avatar_url'],
        favouritecolour = map['favouritecolour'];
}
