
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import '../utils/constants.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';
import 'package:swipe_cards/swipe_cards.dart';

class ActivityRetrieve extends StatefulWidget {
  static const String routeName = '/activity';

  const ActivityRetrieve({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => ActivityRetrieve(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _ActivityRetrieveState createState() => _ActivityRetrieveState();
}

class _ActivityRetrieveState extends AuthRequiredState<ActivityRetrieve> {
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
      print('hello');
      return data.map((e) => toActivity(e)).toList();
    }
    print('hi');
    return [];
  }

  Activity toActivity(Map<String, dynamic> result) {
    return Activity(
      id: result['id'] ?? 'id',
      name: result['name'] ?? 'name',
      phone: result['phone'] ?? 'phone',
      opening: result['opening'] ?? 'opening',
      imageUrls: result['image_url'] ?? 'imageUrls',
      tag: result['tag'] ?? 'tag',
      description: result['description'] ?? 'description',
      address: result['address'] ?? 'address',
      price: result['price'] ?? 'price',
      type: result['type'] ?? 'type',
      postal: result['postal'] ?? 'postal',
      website: result['website'] ?? 'website',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Swipe',),
      body: FutureBuilder<List<Activity>>(
        future: getActivities(),
        builder: (ctx, snapshot) {
          List<Activity> activity = snapshot.data ?? <Activity>[];
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return _buildSwipeView(activity, context);
            default:
              return _buildLoadingScreen();
          }
        },
      ),
    );
  }
}

Widget _buildSwipeView(List<Activity> activity, context) {
  List<SwipeItem> _swipeItems = <SwipeItem>[];

  for (int i = 0; i < activity.length; i++) {
    _swipeItems.add(SwipeItem(
        content: ActivityCard(activity: activity[i]),
        likeAction: () {},
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
            vertical: 8.0,
            horizontal: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {matchEngine.currentItem?.nope();	},
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
                onTap: () { matchEngine.currentItem?.like();	},
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
                onTap: () {},
                child: ChoiceButton(
                width: 60,
                height: 60,
                size: 25,
                color: Color.fromARGB(255, 253, 186, 192),
                hasGradient: false,
                icon: Icons.refresh
              ),
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
      child: CircularProgressIndicator(),
    ),
  );
}
