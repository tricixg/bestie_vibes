// ignore_for_file: unused_import

import 'dart:async';

import 'package:bestie_vibes/blocs/swipe/swipe_event.dart';
import 'package:bestie_vibes/blocs/swipe/swipe_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading());

  @override 
  Stream<SwipeState> mapEventToState(
    SwipeEvent event,
  ) async* {
    if (event is LoadUsersEvent) {
      yield* _mapLoadUsersToState(event);
    }
    if (event is SwipeLeftEvent) {
      yield* _mapSwipeLeftToState(event, state);
    }
    if (event is SwipeRightEvent) {
      yield* _mapSwipeRightToState(event, state);
    }
  }
  
  Stream<SwipeState> _mapLoadUsersToState(LoadUsersEvent event,
  ) async* {
    yield SwipeLoaded(outings: event.outings);
  }
  
  Stream<SwipeState> _mapSwipeLeftToState(
    SwipeLeftEvent event,
    SwipeState state,
  ) async* {
    if (state is SwipeLoaded) {
      try {
        yield SwipeLoaded(outings: List.from(state.outings)..remove(event.outing));
      } catch (_) {}
    }
  }

   Stream<SwipeState> _mapSwipeRightToState(
    SwipeRightEvent event,
    SwipeState state,
  ) async* {
    if (state is SwipeLoaded) {
      try {
        yield SwipeLoaded(outings: List.from(state.outings)..remove(event.outing));
      } catch (_) {}
    }
  }

}
