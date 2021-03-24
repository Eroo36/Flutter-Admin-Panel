import 'package:admin_panel_flutter/models/home_chart/home_chart_model.dart';
import 'package:admin_panel_flutter/views/home/components/line_chart.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeChartModel>(
        builder: (BuildContext context, HomeChartModel model, Widget? child) {
      return PieChartSample2();
    });
  }
}
