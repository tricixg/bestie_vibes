import 'package:bestie_vibes/components/swipeBackground.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swipe_cards/draggable_card.dart';
import '../../utils/constants.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SwipePage extends StatefulWidget {
  static const String routeName = '/swipe';

  const SwipePage({Key? key, required this.outing}) : super(key: key);
  final Outing outing;

  // static Route route() {
  //   return MaterialPageRoute(
  //     builder: (_) => SwipePage(),
  //     settings: RouteSettings(name: routeName),
  //   );
  // }

  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends AuthRequiredState<SwipePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Activity>> getActivities() async {
    final response = await supabase.from('activities').select().execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final List<dynamic> data = response.data;
    if (data != null) {
      return data.map((e) => toActivity(e)).toList();
    }
    return [];
  }

  Activity toActivity(Map<String, dynamic> map) {
    return Activity(
      id: map['id'] ?? 0,
      name: map['name'] ?? 'Name',
      phone: map['phone'] ?? 'Phone',
      opening: map['opening'] ?? 'Opening',
      imageUrls: map['image_url'] ?? 'Image Url',
      tag: map['tag'] ?? 'Tag',
      description: map['description'] ?? 'Description',
      address: map['address'] ?? 'Address',
      price: map['price'] ?? 0,
      type: map['type'] ?? 'Type',
      postal: map['postal'] ?? 'Postal',
      website: map['website'] ?? 'Website',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SWIPE',
      ),
      body: Stack(
        children: [
          swipeBackground(),
          FutureBuilder<List<Activity>>(
            future: getActivities(),
            builder: (ctx, snapshot) {
              List<Activity> activity = snapshot.data ?? <Activity>[];
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return _buildSwipeView(activity, context, widget.outing);
                default:
                  return _buildLoadingScreen();
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildSwipeView(List<Activity> activity, context, Outing outing) {
  final userId = Supabase.instance.client.auth.user()?.id;

  List<SwipeItem> _swipeItems = <SwipeItem>[];

  for (int i = 0; i < activity.length; i++) {
    _swipeItems.add(SwipeItem(
        content: ActivityCard(activity: activity[i]),
        likeAction: () async {
          final insertRes =
              await Supabase.instance.client.from('swipes').insert({
            'activity_id': activity[i].id,
            'outing_id': outing.id,
            'profile_id': userId,
          }).execute();
          print(activity[i].name);
        },
        nopeAction: () {},
        superlikeAction: () {},
        onSlideUpdate: (SlideRegion? region) async {}));
  }
  MatchEngine matchEngine = MatchEngine(swipeItems: _swipeItems);

  return Container(
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        Container(
          child: SwipeCards(
            matchEngine: matchEngine,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: _swipeItems[index].content);
            },
            onStackFinished: () {},
            itemChanged: (SwipeItem item, int index) {},
            upSwipeAllowed: true,
            fillSpace: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  matchEngine.currentItem?.nope();
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
                  matchEngine.currentItem?.like();
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
              InkWell(
                onTap: () async {
                  Navigator.pushNamed(context, '/home');
                  final res = await Supabase.instance.client
                      .from('profiles')
                      .select()
                      .eq('id', userId)
                      .single()
                      .execute();
                  final data = res.data;
                  final insertres =
                      await Supabase.instance.client.from('messages').insert({
                    'room_id': outing.room_id,
                    'profile_id': Supabase.instance.client.auth.user()?.id,
                    'content': '${data['username']} has swiped for ${outing.name}',
                  }).execute();
                },
                child: ChoiceButton(
                    width: 60,
                    height: 60,
                    size: 25,
                    color: Color.fromARGB(255, 253, 186, 192),
                    hasGradient: false,
                    icon: Icons.navigate_next_outlined),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  // return ListView.builder(
  //   itemBuilder: (ctx, idx) {
  //     return ActCard(activity[idx]);
  //   },
  //   itemCount: activity.length,
  // );
}

Widget _buildLoadingScreen() {
  return Center(
    child: Container(
      width: 50,
      height: 50,
      child: CupertinoActivityIndicator(),
    ),
  );
}
