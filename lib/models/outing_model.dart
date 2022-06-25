import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Outing extends Equatable {
  final BigInt id;
  final BigInt group_id;
  final BigInt activity_id;
  final BigInt timeblock_id;

  const Outing({
    required this.id,
    required this.group_id,
    required this.activity_id,
    required this.timeblock_id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
