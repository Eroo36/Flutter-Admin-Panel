import 'package:flutter/material.dart';

enum HomeChartModelStatus {
  Ended,
  Loading,
  Error,
}

class HomeChartModel extends ChangeNotifier {
  HomeChartModelStatus? _status;
  String? _errorCode;
  String? _errorMessage;

  String? get errorCode => _errorCode;
  String? get errorMessage => _errorMessage;
  HomeChartModelStatus? get status => _status;

  HomeChartModel();

  HomeChartModel.instance() {
    // Add code here
  }
}
