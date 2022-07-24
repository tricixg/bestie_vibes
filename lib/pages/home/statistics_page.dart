import 'package:bestie_vibes/models/models.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '/widgets/widgets.dart';
import '../../utils/constants.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatisticsPage extends StatefulWidget {
  static const String routeName = '/statistics';
  const StatisticsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => StatisticsPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends AuthRequiredState<StatisticsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'STATISTICS',
        ),
        body: ListView(children: <Widget>[
          FutureBuilder<List<PieChartSectionData>>(
            future: getStatisticsSummary(),
            builder: (ctx, snapshot) {
              List<PieChartSectionData> statsSummary =
                  snapshot.data ?? <PieChartSectionData>[];
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return _buildSummaryView(statsSummary, context);
                default:
                  return _buildLoadingScreen();
              }
            },
          ),
          FutureBuilder<List<PieChartSectionData>>(
            future: getStatisticsFood(),
            builder: (ctx, snapshot) {
              List<PieChartSectionData> statsFood =
                  snapshot.data ?? <PieChartSectionData>[];
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return _buildFoodView(statsFood, context);
                default:
                  return _buildLoadingScreen();
              }
            },
          ),
          FutureBuilder<List<PieChartSectionData>>(
            future: getStatisticsActivity(),
            builder: (ctx, snapshot) {
              List<PieChartSectionData> statsActivity =
                  snapshot.data ?? <PieChartSectionData>[];
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return _buildActivityView(statsActivity, context);
                default:
                  return _buildLoadingScreen();
              }
            },
          ),
        ]));
  }

  Future<List<PieChartSectionData>> getStatisticsSummary() async {
    final response = await supabase.rpc('stats_summary').execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final List<dynamic> data = response.data;
    if (data != null) {
      return data
          .map((e) => Data(e['type'], e['count']))
          .map((e) => toPieChartSectionData(e))
          .toList();
    }
    return [];
  }

  Future<List<PieChartSectionData>> getStatisticsFood() async {
    final response = await supabase.rpc('stats_food').execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final List<dynamic> data = response.data;
    if (data != null) {
      List<PieChartSectionData> result = data
          .map((e) => Data(e['tag'], e['count']))
          .map((e) => toPieChartSectionData(e))
          .toList();
      print(result);
      return result;
    }
    return [];
  }

  Future<List<PieChartSectionData>> getStatisticsActivity() async {
    final response = await supabase.rpc('stats_activity').execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      context.showErrorSnackBar(message: error.message);
    }
    final List<dynamic> data = response.data;
    if (data != null) {
      List<PieChartSectionData> result = data
          .map((e) => Data(e['tag'], e['count']))
          .map((e) => toPieChartSectionData(e))
          .toList();
      print(result);
      return result;
    }
    return [];
  }

  PieChartSectionData toPieChartSectionData(Data data) {
    return PieChartSectionData(
      color: data.color,
      value: data.count.toDouble(),
      title: '${data.count}',
      radius: 100.0,
      titleStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff)),
      badgeWidget: _Badge(
        data.svgAsset,
        size: 40.0,
        borderColor: data.color,
      ),
      badgePositionPercentageOffset: .98,
    );
  }
}

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const _Badge(
    this.svgAsset, {
    Key? key,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

Widget _buildSummaryView(List<PieChartSectionData> statsSummary, context) {
  return AspectRatio(
    aspectRatio: 1.5,
    child: Card(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: statsSummary),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Indicator(
                color: Color(0xff0293ee),
                text: 'food',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xfff8b250),
                text: 'activity',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    ),
  );
}

Widget _buildFoodView(List<PieChartSectionData> statsFood, context) {
  return AspectRatio(
    aspectRatio: 1.5,
    child: Card(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: statsFood),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Indicator(
                color: Color(0xff0293ee),
                text: 'cafe hopper',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xfff8b250),
                text: 'western palate',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff845bef),
                text: 'sweet tooth',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff13d38e),
                text: 'vegetarian',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xffED6A5E),
                text: 'asian palate',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    ),
  );
}

Widget _buildActivityView(List<PieChartSectionData> statsFood, context) {
  return AspectRatio(
    aspectRatio: 1.5,
    child: Card(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: statsFood),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Indicator(
                color: Color(0xff845bef),
                text: 'partier',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xffC8FFBE),
                text: 'cultured one',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xfff8b250),
                text: 'local "tourist"',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xffED6A5E),
                text: 'thrill seeker',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff0293ee),
                text: 'animal lover',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff13d38e),
                text: 'nature lover',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xffF8BDC4),
                text: 'shopping fanatic',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    ),
  );
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
