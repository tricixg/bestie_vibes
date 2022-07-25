import 'package:bestie_vibes/models/activity_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key, required this.activityid}) : super(key: key);
  final int activityid;


  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends AuthRequiredState<ActivityPage> {
  late Activity data;

  @override
  void initState() {
    super.initState();
  }

  Future<List<Activity>> getActivities() async {
    final response = await supabase.from('activities').select().eq('id', widget.activityid).execute();
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
        title: 'ACTIVITY',
      ),
      body: FutureBuilder<List<Activity>>(
        future: getActivities(),
        builder: (ctx, snapshot) {
          if (snapshot.data == null) {
            return blankActivity();
          }
          List<Activity> activity = snapshot.data ?? <Activity>[];
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return ActivityCard(activity: activity[0]);
            default:
              return _buildLoadingScreen();
          }
        },
      ),
    );
  }
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

class blankActivity extends StatelessWidget {
  const blankActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Color(0xffffcdd1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  padding: const EdgeInsets.only(
                    left: 0,
                    right: 0,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage('')),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.5))
                        ]),
                  ),
                ),
                Text(
                  'NO RESULT :(',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
          ),
        ));
  }
}
