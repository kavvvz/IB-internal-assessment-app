import 'package:internal_assessment_v3/event_page_non_admin.dart';

import 'event_page.dart';
import 'package:flutter/material.dart';
import 'package:internal_assessment_v3/event_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'globals.dart' as globals;
import 'logout_page.dart';

///class that creates the calendar page of the application
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

///the state class of calendar page class
class _CalendarPageState extends State<CalendarPage> {
  DateTime today = DateTime.now();
  DateTime selectedDay = DateTime.now();

  ///called when displaying the calendar to display the focused day
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      globals.today = day;
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.00, -1.29),
                child: Container(
                  width: 500,
                  height: 350,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff008b8b), Color(0xff008b8b00)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  alignment: const AlignmentDirectional(0.00, -1.00),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.94, -1.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>   const LogoutPage()));
                  },
                  iconSize: 40,
                  color: Colors.greenAccent,
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -0.2),
                child: content(),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, -0.55),
                child: Container(
                  width: 500,
                  height: 300,
                  child:  const SizedBox(
                    width: 1,
                    height: 0.2,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, -0.70),
                          child: Text(
                            'Calendar',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(0.0, 0.3),
                child: Text('select a date to add event',
                style: TextStyle(
                  fontSize: 10
                ),),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.4),
                child: TextButton(
                  child: const Text(
                    'Check Events',
                    style: TextStyle(color: Colors.black),
                  ),
                  ///when the 'Check Events' button is pressed
                  onPressed: () {
                    if(globals.defineStatus == 'Admin' ||
                        globals.defineStatus == 'Co-Admin')
                    ///Navigates the user to the event page
                      ///according to their status
                    { //for admins
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EventPage()));
                    }
                    else //for non admins
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EventPageNonAdmin()));
                      }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///called for drawing the calendar according to the dates given
  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SingleChildScrollView(
        child: TableCalendar(
          selectedDayPredicate: (day) => isSameDay(day, globals.today),
          rowHeight: 43,
          locale: "en_US",
          headerStyle: const HeaderStyle(
              formatButtonVisible: false, titleCentered: true),
          availableGestures: AvailableGestures.all,
          focusedDay: globals.today,
          firstDay: DateTime.utc(2000, 01, 01),
          lastDay: DateTime.utc(2099, 12, 31),
          onDaySelected: (day, focusedDay) {
            _onDaySelected(
              day,
              focusedDay,
            );
          },
        ),
      ),
    );
  }
}
