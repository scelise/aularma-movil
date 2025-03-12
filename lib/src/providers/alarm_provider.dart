import 'package:flutter/material.dart';

import '../classes/alarm.dart';

class AlarmProvider with ChangeNotifier {

  List<Alarm> _lAlarms = [];

  List<Alarm> get lAlarms => _lAlarms;

  set lAlarms( List<Alarm> lAlarms ) {

    _lAlarms = lAlarms;

    notifyListeners();

  }

}