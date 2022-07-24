import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/models.dart';
import '../pages.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';

class ResultsPage extends StatefulWidget {
  static const String routeName = '/result';
  const ResultsPage({Key? key, required this.outing, required this.room})
      : super(key: key);
  final Outing outing;
  final Room room;
  // static Route route() {
  //   return MaterialPageRoute(
  //     builder: (_) => ResultsPage(),
  //     settings: RouteSettings(name: routeName),
  //   );
  // }

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends AuthRequiredState<ResultsPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<Activity> getResult() async {
    final res = await Supabase.instance.client.rpc('activity_result',
        params: {'outing_id': widget.outing.id}).execute();
    final data = res.data;

    final result = Activity.fromMap(data);
    return result;
  }

  Future<String> getDate() async {
    final res = await Supabase.instance.client
        .rpc('date_result', params: {'outing_id': widget.outing.id}).execute();
    final data = res.data;

    final result = data.toString();
    final insertres = await Supabase.instance.client
        .from('outings')
        .update({
          'date': data,
        })
        .eq('id', widget.outing.id)
        .execute();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return ChatRoomPage(room: widget.room);
                }),
              );
            },
          ),
          backgroundColor: Colors.pink[50],
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                'lib/assets/images/main.png',
                height: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '${widget.outing.name}',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              FutureBuilder<String>(
                future: getDate(),
                builder: (ctx, snapshot) {
                  if (snapshot.data == null) {
                    return Text('Unavailable');
                  }
                  String date = snapshot.data ?? 'Unavailable';
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return Text(
                        'Possible Date: ${date}',
                        style: TextStyle(fontSize: 20),
                      );
                    default:
                      return _buildLoadingScreen();
                  }
                },
              ),
              FutureBuilder<Activity>(
                future: getResult(),
                builder: (ctx, snapshot) {
                  if (snapshot.data == null) {
                    return blankActivity();
                  }
                  Activity activity = snapshot.data ??
                      Activity(
                          id: 999,
                          name: 'NO RESULT',
                          phone: 'phone',
                          opening: 'opening',
                          imageUrls: 'imageUrls',
                          tag: 'tag',
                          description: 'description',
                          address: 'address',
                          postal: 'postal',
                          price: 2,
                          type: 'type',
                          website: 'website');
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return ActivityCard(activity: activity);
                    default:
                      return _buildLoadingScreen();
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () async {

                  },
                  child: Text('Memories'))
            ],
          ),
        ));
  }
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

Widget _buildLoadingScreen() {
  return Center(
    child: Container(
      width: 50,
      height: 50,
      child: CupertinoActivityIndicator(),
    ),
  );
}
