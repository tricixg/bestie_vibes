import 'package:equatable/equatable.dart';

class Userr extends Equatable {
  final String id;
  final String username;
  final List<dynamic> avatar_url;
  final String favouritecolour;

  const Userr({
    required this.id,
    required this.username,
    required this.avatar_url,
    required this.favouritecolour,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}