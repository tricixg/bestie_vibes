import 'package:flutter/material.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends StatefulWidget {
  static const String routeName = '/datepicker';

  const DatePickerPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => DatePickerPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends AuthRequiredState<DatePickerPage> {
  DateRangePickerController _controller = DateRangePickerController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'DATE PICKER',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.3,
                child: SfDateRangePicker(
                  enablePastDates: false,
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.multiRange,
                  showActionButtons: true,
                  showNavigationArrow: true,
                  showTodayButton: true,
                  backgroundColor: Colors.white,
                  rangeSelectionColor: Color.fromARGB(255, 255, 212, 216),
                  todayHighlightColor: Color.fromARGB(255, 255, 168, 175),
                  controller: _controller,
                  onViewChanged: (view) {
                    print(view);
                  },
                  onSubmit: (date) {
                    print(date);
                  },
                ),
              ),
            ),
          ),
          Text(
            'Select dates you are available to meet',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
