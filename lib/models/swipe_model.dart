import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Swipe extends Equatable {
  final BigInt id;
  final BigInt outing_id;
  final String user_id;
  final BigInt activity_id;

  const Swipe({
    required this.id,
    required this.outing_id,
    required this.user_id,
    required this.activity_id,
  });

  @override
  List<Object?> get props => [
        outing_id,
        user_id,
        activity_id,
      ];
}
