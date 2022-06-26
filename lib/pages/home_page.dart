
import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomePage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends AuthRequiredState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Text('Something went wrong'),
      //  BlocBuilder<SwipeBloc, SwipeState>(
      //   builder: (context, state) {
      //     if (state is SwipeLoading) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (state is SwipeLoaded) {
      //       return Column(
      //         children: [
      //           Draggable(
      //             child: ActivityCard(activity: state.activity[0]),
      //             feedback: ActivityCard(activity: state.activity[0]),
      //             childWhenDragging:
      //                 ActivityCard(activity: state.activity[1]),
      //             onDragEnd: (drag) {
      //               if (drag.velocity.pixelsPerSecond.dx < 0) {
      //                 context.read<SwipeBloc>()
      //                   ..add(SwipeLeftEvent(activity: state.activity[0]));
      //                 print('swipe left');
      //               } else {
      //                 context.read<SwipeBloc>()
      //                   ..add(SwipeRightEvent(activity: state.activity[0]));
      //                 print('swipe right');
      //               }
      //             },
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.symmetric(
      //               vertical: 8.0,
      //               horizontal: 60,
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 InkWell(
      //                   onTap: () {
      //                     context.read<SwipeBloc>()
      //                       ..add(
      //                           SwipeLeftEvent(activity: state.activity[0]));
      //                   },
      //                   child: ChoiceButton(
      //                     width: 60,
      //                     height: 60,
      //                     size: 25,
      //                     hasGradient: false,
      //                     color: Color.fromARGB(255, 253, 186, 192),
      //                     icon: Icons.clear_rounded,
      //                   ),
      //                 ),
      //                 InkWell(
      //                   onTap: () {
      //                     context.read<SwipeBloc>()
      //                       ..add(
      //                           SwipeRightEvent(activity: state.activity[0]));
      //                   },
      //                   child: ChoiceButton(
      //                     width: 80,
      //                     height: 80,
      //                     size: 30,
      //                     color: Colors.white,
      //                     hasGradient: true,
      //                     icon: Icons.favorite,
      //                   ),
      //                 ),
      //                 ChoiceButton(
      //                   width: 60,
      //                   height: 60,
      //                   size: 25,
      //                   color: Color.fromARGB(255, 253, 186, 192),
      //                   hasGradient: false,
      //                   icon: Icons.watch_later,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       );
      //     } else {
      //       return Text('Something went wrong');
      //     }
      //   },
      // ),
    );
  }
}
