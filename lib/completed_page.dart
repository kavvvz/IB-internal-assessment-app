import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event_widget.dart';
import 'events.dart';

///Creating the screen that is displayed when the 'completed' tab is selected for admins
class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsProvider>(context);

    final events = provider.eventsCompleted;
    return events.isEmpty?const Center(
      child: Text(
        'no events completed today :(',
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


///Creating the screen that is displayed when the 'completed' tab is selected for non-admins
class CompletedListNonAdminWidget extends StatelessWidget {
  const CompletedListNonAdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsProvider>(context);

    final events = provider.eventsCompleted;
    return events.isEmpty?const Center(
      child: Text(
        'no events completed today :(',
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
