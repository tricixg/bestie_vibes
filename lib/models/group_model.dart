import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final BigInt id;
  final String name;
  final String creator_id;

  const Group({
    required this.id,
    required this.name,
    required this.creator_id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
