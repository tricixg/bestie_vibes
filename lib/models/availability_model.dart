import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Availability extends Equatable {
  final BigInt id;
  final String user_id;
  final BigInt timeblock_id;
  final BigInt outing_id;

  const Availability({
    required this.id,
    required this.user_id,
    required this.timeblock_id,
    required this.outing_id,
  });

  @override
  List<Object?> get props => [
        user_id,
        timeblock_id,
        outing_id,
      ];
}
