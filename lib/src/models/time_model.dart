import 'package:flutter/material.dart';
import 'package:netninja_worldtime/src/services/world_time.dart';

class TimeModel extends ChangeNotifier {
  late WorldTime _time;
  bool _isLoading = false;

  TimeModel() {
    this.time = WorldTime('', '', '');
  }

  WorldTime get time => _time;

  set time(WorldTime time) {
    _time = time;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }


}