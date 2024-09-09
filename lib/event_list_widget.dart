import 'package:flutter/material.dart';
import 'package:internal_assessment_v3/events.dart';
import 'package:provider/provider.dart';

import 'event_int.dart';
import 'event_widget.dart';

///creates the tab that displays event lists for admins
class EventListWidget extends StatelessWidget {
  const EventListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsProvider>(context);
    final events = provider.events;
    return events.isEmpty?const Center(
      child: Text(
        'no events today :)',
        style: TextStyle(fontSize: 22),
      ),
    ):ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
        itemBuilder: (context, index){
      final event = events[index];
          return EventWidget(event: event);
    },

        separatorBuilder: (context, index) => Container(height: 8),
        itemCount: events.length);
  }
}


///creates the tab that displays the event lists for non-admins
class EventListNonAdminWidget extends StatelessWidget {
  const EventListNonAdminWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsProvider>(context);
    final events = provider.events;
    return events.isEmpty?const Center(
      child: Text(
        'no events today :)',
        style: TextStyle(fontSize: 22),
      ),
    ):ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index){
          final event = events[index];
          return EventWidgetNonAdmin(event: event);
        },

        separatorBuilder: (context, index) => Container(height: 8),
        itemCount: events.length);
  }
}
