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

///creates the page that displays both complete and incomplete events for admins
class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  String formattedDate = DateFormat.yMMMMd().format(globals.today);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      EventListWidget(),
      CompletedListWidget(),
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
        ///obtaining data from firebase
        body:  StreamBuilder<List<Event>>(
          stream: FirebaseAPI().events,
          builder: (context, snapshot) {
            ///looking at the state of the data coming from firebase
            switch (snapshot.connectionState) {
              //if it is waiting for the data
              case ConnectionState.waiting:
                //displays loading symbol
                return const Center(child: CircularProgressIndicator());
              default:
                //checks for error and prints the error as a debugger
                if (snapshot.hasError) {
                  print("Error: ${snapshot.error}");
                  return const Text('something went wrong');
                } else //displays the data
                {
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

        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => const AddEventDialogWidget(),
          ),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

}
