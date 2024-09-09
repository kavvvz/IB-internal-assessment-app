import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internal_assessment_v3/utils.dart';
import 'globals.dart' as globals;

///to create the selected time field to be displayed
class EventField{
  static const createdTime = 'createdTime';
}

///creates the class for Event so the objects can be created later on
class Event{
  late DateTime createdTime;
  late String eventName;
  late String eventVenue;
  late String eventPhoto;
  late String eventFood;
  late String numGuest;
  late String id;
  late bool isDone;
  Event({
    required this.eventName,
    required this.createdTime,
    this.eventVenue = '',
    this.eventPhoto = '',
    this.eventFood = '',
    this.numGuest = '',
    this.id = '',
    this.isDone = false,
});

  ///converting from Json to display in the application
  static Event fromJson(Map<String, dynamic> json) => Event(
    createdTime: Utils.toDateTime(json['createdTime']),
    eventName: json['eventName'],
    eventVenue: json['eventVenue'],
    eventPhoto: json['eventPhoto'],
    eventFood: json['eventFood'],
    numGuest: json['numGuest'],
    id: json['id'],
    isDone: json['isDone'],
  );

  ///converting to compatible file type to store in firebase
  Map<String, dynamic> toJson() => {
    'createdTime': Utils.fromDateTimeToJson(createdTime),
    'eventName': eventName,
    'eventVenue': eventVenue,
    'eventPhoto': eventPhoto,
    'eventFood': eventFood,
    'numGuest': numGuest,
    'id': id,
    'isDone':isDone,
  };

  ///retrieves data from the database
  factory Event.fromSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Event(
      eventName: data['eventName'],
      eventVenue: data['eventVenue'],
      eventPhoto: data['eventPhoto'],
      eventFood: data['eventFood'],
      numGuest: data['numGuest'],
      isDone: data['isDone'],
      id: data['id'],
      createdTime: data['createdTime'],

      // initialize other properties from the data...
    );
  }
}