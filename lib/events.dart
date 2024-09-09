import 'package:flutter/material.dart';
import 'package:internal_assessment_v3/firebase_api.dart';
import 'package:share_plus/share_plus.dart';
import 'globals.dart' as globals;
import 'event_int.dart';

///contains all the functions associated with events
class EventsProvider extends ChangeNotifier{
  List<Event> _events = [

  ];

  ///returns incomplete events to display
  List<Event> get events {
    return _events
        .where((event) =>
    event.createdTime.year == globals.today.year &&
        event.createdTime.month == globals.today.month &&
        event.createdTime.day == globals.today.day &&
        !event.isDone)
        .toList();
  }

  ///returns completed events to display
  List<Event> get eventsCompleted {
    return _events
        .where((event) =>
    event.createdTime.year == globals.today.year &&
        event.createdTime.month == globals.today.month &&
        event.createdTime.day == globals.today.day &&
        event.isDone)
        .toList();
  }


  ///adds event to database
  void addEvent(Event event) => FirebaseAPI.createEvent(event);

  ///deletes event from database
  void removeEvent(Event event) => FirebaseAPI.deleteEvent(event);

  ///marks the event as complete or incomplete
  bool toggleEventStatus(Event event) {
    event.isDone = !event.isDone;
        FirebaseAPI.updateEvent(event);
        return event.isDone;
  }

  ///when called, exports the event outside the app
  Future<void> exportEvent(Event event) async {
    String isDoneString = '';

    //getting the status of the event as a string
    if(event.isDone == true){
      isDoneString = 'Event Completed';
    } else{
      isDoneString = 'Event Not Completed';
    }
    //uses library: Share class from the package installed to export the event
    await Share.share('Event Name: ${event.eventName}\n'
        'Event Venue: ${event.eventVenue}\n'
        'Event Photographer: ${event.eventPhoto}\n'
        'Event Caterer: ${event.eventFood}\n'
        'Number of Guests: ${event.numGuest}\n'
        'Event Date: ${event.createdTime.toString()}\n'
        'Event Status:$isDoneString');
  }

  ///function to accept data and edit the data in firebase accordingly
  void updateEvent(Event event, String eventName, String eventVenue, String eventPhoto, String eventFood, String numGuest) {
    event.eventName = eventName;
    event.eventVenue = eventVenue;
    event.eventPhoto = eventPhoto;
    event.eventFood = eventFood;
    event.numGuest = numGuest;
    FirebaseAPI.updateEvent(event);
  }

  ///adds the events to the list of events
  void setEvents(List<Event> events) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _events = List.from(events);
        notifyListeners();
      });
}
