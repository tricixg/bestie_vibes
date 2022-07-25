import 'package:bestie_vibes/models/outing_model.dart';
import 'package:flutter/foundation.dart';

class OutingProvider extends ChangeNotifier {
  final List<Outing> _outings = [];

  List<Outing> get outings => _outings;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Outing> get eventsOfSelectedDate => outings;

  void addOuting(Outing outing) {
    _outings.add(outing);

    notifyListeners();
  }
}
