import 'package:bestie_vibes/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class SwipeState extends Equatable {
  const SwipeState();

  @override
  List<Object> get props => [];
}

class SwipeLoading extends SwipeState {}

class SwipeLoaded extends SwipeState {
  final List<Activity> activities;

  SwipeLoaded({
    required this.activities,
  });

  @override
  List<Object> get props => [activities];
}

class SwipeError extends SwipeState {}
