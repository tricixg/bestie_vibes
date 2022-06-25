import 'dart:ffi';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final List<dynamic> avatar_url;
  final String favouritecolour;

  const User({
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
