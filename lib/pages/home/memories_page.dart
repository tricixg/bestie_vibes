import 'package:bestie_vibes/models/outing_model.dart';
import 'package:bestie_vibes/pages/memories/memory_page.dart';
import 'package:bestie_vibes/widgets/memory_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../utils/constants.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MemoriesPage extends StatefulWidget {
  static const String routeName = '/memories';
  const MemoriesPage({
    Key? key,
  }) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => MemoriesPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _MemoriesPageState createState() => _MemoriesPageState();
}

class _MemoriesPageState extends AuthRequiredState<MemoriesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'MEMORIES',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            FutureBuilder<List<Outing>>(
              future: getOutings(),
              builder: (ctx, snapshot) {
                List<Outing> outings = snapshot.data ?? <Outing>[];
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    List<Meeting> _getDataSource() {
                      final List<Meeting> meeting = <Meeting>[];
                      final DateTime today = DateTime.now();
                      final DateTime startTime =
                          DateTime(today.year, today.month, today.day, 9, 0, 0);
                      final DateTime endTime =
                          startTime.add(const Duration(hours: 2));
                      for (int i = 0; i < outings.length; i++) {
                        meeting.add(Meeting(
                            outings[i].name,
                            outings[i].date ?? DateTime(0000),
                            outings[i].date ?? DateTime(0000),
                            const Color(0xFFFD6974),
                            false,
                            outings[i]));
                      }
                      return meeting;
                    }

                    return Expanded(
                      child: SfCalendar(
                        view: CalendarView.month,
                        monthViewSettings: MonthViewSettings(
                            showAgenda: false,
                            appointmentDisplayMode:
                                MonthAppointmentDisplayMode.indicator),
                        dataSource: MeetingDataSource(_getDataSource()),
                        onTap: (details) {
                          Scaffold.of(context).showBottomSheet<void>(
                            (BuildContext context) {
                              return Container(
                                height: 200,
                                color: Color.fromARGB(255, 255, 213, 216),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6.7,
                                        child: ListView.builder(
                                          itemCount:
                                              details.appointments!.length,
                                          itemBuilder: (context, index) {
                                            final cards =
                                                details.appointments![index]
                                                    as Meeting;
                                            return memoryCard(
                                                outing: cards.outing);
                                          },
                                        ),
                                      ),
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () => Navigator.pop(context),
                                        )
                                    ],
                                  ),
                                ),
                              );
                            },
                            
                          );
                        },
                      ),
                    );
                  default:
                    return _buildLoadingScreen();
                }
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
            )
          ],
        ),
      ),
    );
  }

  Future<List<Outing>> getOutings() async {
    final response = await supabase.from('outings:creator_id=eq.${Supabase.instance.client.auth.user()?.id}').select().execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final List<dynamic> data = response.data;
    if (data != null) {
      return data.map((e) => toOuting(e)).toList();
    }
    return [];
  }

  Outing toOuting(Map<String, dynamic> map) {
    return Outing(
        id: map['id'] ?? 0,
        name: map['name'] ?? 'Name',
        createdAt: DateTime.parse(map['created_at']),
        date: map['date'] != null ? DateTime.parse(map['date']) : null,
        room_id: map['room_id'],
        activity_id: map['activity_id'] ?? null,
        creator_id: map['creator_id']);
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  String getOuting(int index) {
    return appointments![index].outing;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay,
      this.outing);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  Outing outing;
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
