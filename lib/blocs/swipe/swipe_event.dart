import 'package:equatable/equatable.dart';
import 'package:bestie_vibes/models/models.dart';

abstract class SwipeEvent extends Equatable {
  const SwipeEvent();

  @override
  List<Object?> get props => [];
}

class LoadUsersEvent extends SwipeEvent {
  final List<Outing> outings;

  LoadUsersEvent({
    required this.outings,
  });

  @override
  List<Object?> get props => [outings];
}



class SwipeLeftEvent extends SwipeEvent {
  final Outing outing;

  SwipeLeftEvent({
    required this.outing,
  });

  @override
  List<Object?> get props => [outing];
}

class SwipeRightEvent extends SwipeEvent {
  final Outing outing;

  SwipeRightEvent({
    required this.outing,
  });

  @override
  List<Object?> get props => [outing];
}