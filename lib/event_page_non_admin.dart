import 'package:flutter/material.dart';
import 'package:internal_assessment_v3/events.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'add_event_dialog.dart';
import 'completed_page.dart';
import 'event_int.dart';
import 'event_list_widget.dart';
import 'firebase_api.dart';
import 'globals.dart' as globals;
import 'package:intl/intl.dart';

///creates a page that displays both complete and incomplete events for team members
class EventPageNonAdmin extends StatefulWidget {
  const EventPageNonAdmin({super.key});

  @override
  State<EventPageNonAdmin> createState() => _EventPageState();
}

class _EventPageState extends State<EventPageNonAdmin> {
  String formattedDate = DateFormat.yMMMMd().format(globals.today);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      EventListNonAdminWidget(),
      CompletedListNonAdminWidget(),
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff008b8b),
          leading: Navigator.canPop(context)
              ? IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
              : null,
          title: Text(
            formattedDate,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [BottomNavigationBarItem(
          icon: Icon(Icons.fact_check_outlined),
          label: 'Todos',
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          ),],
          backgroundColor: const Color(0xff008b8b),
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
            selectedIndex = index;
          }),
        ),
        body:  StreamBuilder<List<Event>>(
          stream: FirebaseAPI().events,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  print("Error: ${snapshot.error}");
                  return const Text('something went wrong');
                } else {
                  print('it works');
                  final events = snapshot.data;

                  final provider = Provider.of<EventsProvider>(context);
                  provider.setEvents(events!);

                  print('Number of events received: ${events.length}');
                  print('Selected index: $selectedIndex');

                  return tabs[selectedIndex];
                }
            }
          },
        ),
      ),
    );
  }

}
