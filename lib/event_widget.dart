import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:internal_assessment_v3/events.dart';
import 'package:internal_assessment_v3/utils.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'edit_event.dart';
import 'event_int.dart';

///creates the event slidable widget for displaying events for admins
class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({
    required this.event,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 1,
        children: [
          SlidableAction(
            label: 'edit',
            backgroundColor: Colors.greenAccent,
            icon: Icons.edit,
            onPressed: (context) => editEvent(context, event),
          ),
          SlidableAction(
            label: 'delete',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (context) => deleteEvent(context, event),
          ),
          SlidableAction(
            label: 'share',
            backgroundColor: Colors.cyanAccent,
            icon: Icons.ios_share,
            //exports the information outside the application by calling the function
            onPressed: (context) => shareEvent(context, event),
          ),
        ],
      ), child: buildEvent(context),
    ),
  );

  Widget buildEvent(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white54,
        child: Row(
          children: [
            Checkbox(
              value: event.isDone,
              onChanged: (_) {
                final provider = Provider.of<EventsProvider>(context, listen: false);
                final isDone = provider.toggleEventStatus(event);
                Utils.showSnackBar(context, isDone?'event completed':'event marked incomplete');

              },
              activeColor: const Color(0xff008b8b),
              checkColor: Colors.white,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff008b8b),
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'Venue = ' + event.eventVenue,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xff008b8b),
                      fontSize: 15,
                    ),
                  ),
                  if (event.eventPhoto.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Text(
                        'Photographer = ' + event.eventPhoto,
                        style: const TextStyle(fontSize: 15, height: 1.5),
                      ),
                    ),
                  if (event.eventFood.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Text(
                        'Caterer = ' + event.eventFood,
                        style: const TextStyle(fontSize: 15, height: 1.5),
                      ),
                    ),
                  if (event.numGuest.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Text(
                        'Number of Guests = ' + event.numGuest,
                        style: const TextStyle(fontSize: 15, height: 1.5),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      );

  void deleteEvent(BuildContext context, Event event) {
    final provider = Provider.of<EventsProvider>(context, listen: false);
    provider.removeEvent(event);

    Utils.showSnackBar(context, 'Deleted');
  }

  ///exports the event outside the application by calling the exportEvent function
  Future<void> shareEvent(BuildContext context, Event event) async {
    final provider = Provider.of<EventsProvider>(context, listen: false);
    provider.exportEvent(event);
  }

 void editEvent(BuildContext context, Event event) => Navigator.of(context).push(
   MaterialPageRoute(builder: (context) => EditEventPage(event: event)),
 );

}

///creates the event slidable widget for displaying events for non-admins
class EventWidgetNonAdmin extends StatelessWidget {
  final Event event;
  const EventWidgetNonAdmin({
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 1,
        children: [
          SlidableAction(
            label: 'share',
            backgroundColor: Colors.cyanAccent,
            icon: Icons.ios_share,
            onPressed: (context) => shareEvent(context, event),
          ),
        ],
      ), child: buildEvent(context),
    ),
  );

  Widget buildEvent(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    color: Colors.white54,
    child: Row(
      children: [
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.eventName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff008b8b),
                  fontSize: 22,
                ),
              ),
              Text(
                'Venue = ' + event.eventVenue,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Color(0xff008b8b),
                  fontSize: 15,
                ),
              ),
              if (event.eventPhoto.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Text(
                    'Photographer = ' + event.eventPhoto,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                ),
              if (event.eventFood.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Text(
                    'Caterer = ' + event.eventFood,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                ),
              if (event.numGuest.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Text(
                    'Number of Guests = ' + event.numGuest,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                ),
            ],
          ),
        )
      ],
    ),
  );
  ///exports the event outside the app
  Future<void> shareEvent(BuildContext context, Event event) async {
    final provider = Provider.of<EventsProvider>(context, listen: false);
    provider.exportEvent(event);
  }
}
