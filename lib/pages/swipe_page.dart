import 'package:bestie_vibes/blocs/swipe/swipe.dart';
import 'package:flutter/material.dart';
import '/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class SwipePage extends StatefulWidget {
  static const String routeName = '/swipe';
  const SwipePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => SwipePage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends AuthRequiredState<SwipePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SWIPE',
      ),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            return Column(
              children: [
                Draggable(
                  child: OutingCard(outing: state.outings[0]),
                  feedback: OutingCard(outing: state.outings[0]),
                  childWhenDragging: OutingCard(outing: state.outings[1]),
                  onDragEnd: (drag) {
                    if (drag.velocity.pixelsPerSecond.dx < 0) {
                      context.read<SwipeBloc>()
                        ..add(SwipeLeftEvent(outing: state.outings[0]));
                      print('swipe left');
                    } else {
                      context.read<SwipeBloc>()
                        ..add(SwipeRightEvent(outing: state.outings[0]));
                      print('swipe right');
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 60,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeftEvent(outing: state.outings[0]));
                        },
                        child: ChoiceButton(
                          width: 60,
                          height: 60,
                          size: 25,
                          hasGradient: false,
                          color: Color.fromARGB(255, 253, 186, 192),
                          icon: Icons.clear_rounded,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeRightEvent(outing: state.outings[0]));
                        },
                        child: ChoiceButton(
                          width: 80,
                          height: 80,
                          size: 30,
                          color: Colors.white,
                          hasGradient: true,
                          icon: Icons.favorite,
                        ),
                      ),
                      ChoiceButton(
                        width: 60,
                        height: 60,
                        size: 25,
                        color: Color.fromARGB(255, 253, 186, 192),
                        hasGradient: false,
                        icon: Icons.watch_later,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
