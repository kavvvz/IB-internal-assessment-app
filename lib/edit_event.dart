import 'package:flutter/material.dart';
import 'package:internal_assessment_v3/event_form.dart';
import 'package:internal_assessment_v3/events.dart';
import 'package:provider/provider.dart';

import 'event_int.dart';

///The page that is shown when the admin decides to edit the event
class EditEventPage extends StatefulWidget {
  final Event event;
  const EditEventPage({super.key, required this.event});

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

///the state class of EditEventPage
class _EditEventPageState extends State<EditEventPage> {
  final _formKey = GlobalKey<FormState>();
  late String eventName;
  late String eventVenue;
  late String eventPhoto;
  late String eventFood;
  late String numGuest;

  ///initializes the event fields
  @override
  void initState(){
    super.initState();
    eventName = widget.event.eventName;
    eventVenue = widget.event.eventVenue;
    eventPhoto = widget.event.eventPhoto;
    eventFood = widget.event.eventFood;
    numGuest = widget.event.numGuest;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xff008b8b),
      title: Text('Edit'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: EventFormWidget(
          eventName: eventName,
          eventVenue: eventVenue,
          eventFood: eventFood,
          eventPhoto: eventPhoto,
          numGuest: numGuest,
          //sets state for the new data added
          onChangedEventName: (eventName) => setState(() => this.eventName = eventName),
          onChangedEventVenue: (eventVenue) => setState(() => this.eventVenue = eventVenue),
          onChangedEventPhoto: (eventPhoto) => setState(() => this.eventPhoto = eventPhoto),
          onChangedEventFood: (eventFood) => setState(() => this.eventFood = eventFood),
          onChangedNumGuest: (numGuest) => setState(() => this.numGuest = numGuest),
          onSavedEvent: saveEvent,
        
        ),
      ),
    ),
  );

  ///saves the edited event
  void saveEvent() {
    //validates the text in text controller
    final isValid = _formKey.currentState?.validate();
    if(!isValid!){
      return;
    }else{
      final provider = Provider.of<EventsProvider>(context, listen: false);
      provider.updateEvent(widget.event, eventName,
          eventVenue, eventPhoto, eventFood, numGuest);
      //goes back to event page
      Navigator.of(context).pop();
    }
  }
}
