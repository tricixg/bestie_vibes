import 'package:bestie_vibes/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/models.dart';
import '/widgets/widgets.dart';
import 'package:bestie_vibes/components/auth_required_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends StatefulWidget {
  static const String routeName = '/datepicker';

  const DatePickerPage({Key? key, required this.outing}) : super(key: key);
  final Outing outing;


  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends AuthRequiredState<DatePickerPage> {
  DateRangePickerController _controller = DateRangePickerController();
  String _dateCount = '';
  List<DateTime> _selectedDates = [];
  final userId = Supabase.instance.client.auth.user()?.id;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        
          onPressed: () async {
            for (int i = 0; i < _selectedDates.length; i++) {
              
              final insertRes =
                  await Supabase.instance.client.from('availabilities').insert({
                'date': DateFormat("yyyy-MM-dd").format(_selectedDates[i]),
                'outing_id': widget.outing.id,
                'profile_id': userId,
              }).execute();
            }
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return SwipePage(outing: widget.outing);
              }),
            );
          },
          backgroundColor: Color(0xFFFD6974),
          label: const Text('DONE'),
          icon: const Icon(Icons.navigate_next)),
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
                  selectionMode: DateRangePickerSelectionMode.multiple,
                  showActionButtons: false,
                  showNavigationArrow: true,
                  showTodayButton: true,
                  confirmText: 'Contirm',
                  cancelText: '',
                  backgroundColor: Colors.white,
                  rangeSelectionColor: Color.fromARGB(255, 255, 212, 216),
                  todayHighlightColor: Color.fromARGB(255, 255, 168, 175),
                  controller: _controller,
                  onViewChanged: (view) {
                    print(view);
                  },
                  onSelectionChanged: _onSelectionChanged,
                ),
              ),
            ),
          ),
          Text(
            'Select dates you are available to meet',
            style: TextStyle(fontSize: 14),
          ),
          Text('Selected date count: $_dateCount',
              style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
        _selectedDates = args.value;
        print(args.value);
        print(DateFormat("yyyy-MM-dd").format(args.value[0]));
      }
    });
  }


}
