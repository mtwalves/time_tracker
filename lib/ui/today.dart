import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:time_tracker/core/time_sheet.dart';
import 'package:time_tracker/core/extensions/duration.dart';

class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TimeSheet timeSheet = Provider.of<TimeSheet>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Time tracker'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions), label: 'Today'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment_turned_in_outlined,
              ),
              label: 'History')
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.fingerprint),
          onPressed: () async {
            TimeOfDay? selectedTime = await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
            );
            print(selectedTime?.format(context));
            if (selectedTime != null) {
              timeSheet.punch(selectedTime);
            }
          }),
      body: Consumer<TimeSheet>(
        builder: (context, timeSheet, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Worked hours'),
                  Text(timeSheet.today.workedTime.inHHmm())
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Overtime'),
                  Text(timeSheet.today.overtime.inHHmm())
                ],
              ),
              Expanded(child: PunchList(timeSheet.today.punches)),
            ],
          ),
        ),
      ),
    );
  }
}

class PunchList extends StatelessWidget {
  PunchList(this.punches);

  final List<DateTime> punches;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: punches.length,
        itemBuilder: (BuildContext context, int current) {
          if (current.isEven) {
            return ListTile(
              title: Text('Punch in'),
              leading: Icon(Icons.login),
              subtitle: Text(DateFormat.Hm().format(punches[current])),
            );
          }

          return ListTile(
            title: Text('Punch out'),
            leading: Icon(Icons.logout),
            subtitle: Text(DateFormat.Hm().format(punches[current])),
          );
        });
  }
}
