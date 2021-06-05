import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:time_tracker/core/time_sheet.dart';
import 'package:time_tracker/ui/today.dart';

void main() {
  runApp(TimeTracker());
}

class TimeTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) => TimeSheet(), child: Today()),
    );
  }
}
