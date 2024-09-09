import 'package:flutter/material.dart';
import 'package:internal_assessment_v3/events.dart';
import 'package:provider/provider.dart';
import 'event_int.dart';
import 'globals.dart' as globals;
import 'event_form.dart';

///this class is called to display 'add event' dialog box
class AddEventDialogWidget extends StatefulWidget {
  const AddEventDialogWidget({super.key});

  @override
  State<AddEventDialogWidget> createState() => _AddEventDialogWidgetState();
}

///since it is a stateful class, this is the state class
class _AddEventDialogWidgetState extends State<AddEventDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String eventName = '';
  String eventVenue = '';
  String eventPhoto = '';
  String eventFood = '';
  String numGuest = '';
  final DateTime eventDate = globals.today;
  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Add Event',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          ),
          const SizedBox(height: 8),
          EventFormWidget(
            onChangedEventName: (eventName) => setState(() => this.eventName = eventName),
            onChangedEventVenue: (eventVenue) => setState(() => this.eventVenue = eventVenue),
            onChangedEventPhoto: (eventPhoto) => setState(() => this.eventPhoto = eventPhoto),
            onChangedEventFood: (eventFood) => setState(() => this.eventFood = eventFood),
            onChangedNumGuest: (numGuest) => setState(() => this.numGuest = numGuest),
            onSavedEvent: addEvent,
          )
        ],
      ),
    ),
  );
  ///this validates whether the required data is empty or not and if not adds the event to the database
  ///and displays it A
  void addEvent() {
    final isValid = _formKey.currentState?.validate();
    if(!isValid!){
      return;
    } else{
      final event = Event(
        id: DateTime.now().toString(),
        eventName: eventName,
        eventVenue: eventVenue,
        eventPhoto: eventPhoto,
        eventFood: eventFood,
        numGuest: numGuest,
        createdTime: globals.today
      );
      final provider = Provider.of<EventsProvider>(context, listen: false);
      provider.addEvent(event);
      Navigator.of(context).pop();
    }
  }
}
