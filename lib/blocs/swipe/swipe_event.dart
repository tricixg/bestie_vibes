import 'package:equatable/equatable.dart';
import 'package:bestie_vibes/models/models.dart';

abstract class SwipeEvent extends Equatable {
  const SwipeEvent();

  @override
  List<Object?> get props => [];
}

class LoadUsersEvent extends SwipeEvent {
  final List<Activity> activities;

  LoadUsersEvent({
    required this.activities,
  });

  @override
  List<Object?> get props => [activities];
}

class SwipeLeftEvent extends SwipeEvent {
  final Activity activity;

  SwipeLeftEvent({
    required this.activity,
  });

  @override
  List<Object?> get props => [activity];
}

class SwipeRightEvent extends SwipeEvent {
  final Activity activity;

  SwipeRightEvent({
    required this.activity,
  });

  @override
  List<Object?> get props => [activity];
}
