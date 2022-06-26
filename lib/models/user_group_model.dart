import 'dart:ffi';

import 'package:equatable/equatable.dart';

class UserGroup extends Equatable {
  final BigInt id;
  final String user_id;
  final BigInt group_id;

  const UserGroup({
    required this.id,
    required this.user_id,
    required this.group_id,
  });

  @override
  List<Object?> get props => [user_id, group_id];
}
