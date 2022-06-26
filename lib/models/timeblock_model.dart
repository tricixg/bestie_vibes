import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Timeblock extends Equatable {
  final BigInt id;
  final String date;
  final String time;

  const Timeblock({
    required this.id,
    required this.date,
    required this.time,
  });

  @override
  List<Object?> get props => [date, time];
}
