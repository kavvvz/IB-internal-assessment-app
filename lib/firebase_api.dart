import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'event_int.dart';
import 'utils.dart';
import 'globals.dart' as globals;

///contains functions associated with add/reading data from database
class FirebaseAPI{

  ///adds event to firebase to push
  static Future<String> createEvent(Event event) async{
    final docEvent = FirebaseFirestore.instance.collection('events').doc();
    event.id = docEvent.id;
    await docEvent.set(event.toJson());
    return docEvent.id;
  }

  ///gets the event from database
  List<Event> eventListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      Timestamp timestamp = doc.get("createdTime");
      DateTime createdTime = timestamp.toDate();
      print("Document data: ${doc.data()}");
      return Event(
        eventName: doc.get("eventName") ?? '',
        eventVenue: doc.get("eventVenue") ?? '',
        eventFood: doc.get("eventFood") ?? '',
        eventPhoto: doc.get("eventPhoto") ?? '',
        numGuest: doc.get("numGuest") ?? '',
        createdTime: createdTime,
        isDone: doc.get("isDone") ?? false, //
        id: doc.id,
      );
    }).toList();


  }

  ///getting the events from the database
  Stream<List<Event>> get events{
    //calling the collection of events
    final CollectionReference eventCollection =
    FirebaseFirestore.instance.collection('events');
    //filtering the data according to date
    final Query ofDate =
    eventCollection.where("createdTime", isEqualTo: globals.today);
    return ofDate.snapshots().map(eventListFromSnapshot);
  }

  ///reads the event from database
  static Stream<List<Event>> readEvents() {
    return FirebaseFirestore.instance
        .collection('events')
        .where('createdTime', isEqualTo: globals.today)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Event> events = [];
      querySnapshot.docs.forEach((DocumentSnapshot doc) {
        // Assuming you have an Event class and a fromSnapshot method
        events.add(Event.fromSnapshot(doc));
      });
      return events;
    });

  }

  ///function to edit the data in firebase
  static Future updateEvent(Event event) async {
    final docEvent = FirebaseFirestore.instance.collection('events').doc(
        event.id);
    //toJson: function made for converting to compatible file type
    //update function from the library class of cloud_firestore
    await docEvent.update(event.toJson());
  }

  ///function to delete data in firebase
  static Future deleteEvent(Event event) async{
    final docEvent = FirebaseFirestore.instance.collection('events').doc(event.id);
    //delete function from the library class of cloud_firestore
    await docEvent.delete();
  }
}