import 'dart:math';
import 'globals.dart' as globals;
import 'package:flutter/material.dart';

///builds the 'add event' dialog box which is displayed when AddEventDialogWidget class is called
class EventFormWidget extends StatelessWidget {
  final String eventName;
  final String eventVenue;
  final String eventPhoto;
  final String eventFood;
  final String numGuest;
  final DateTime eventDate = globals.today;
  final ValueChanged<String> onChangedEventName;
  final ValueChanged<String> onChangedEventVenue;
  final ValueChanged<String> onChangedEventPhoto;
  final ValueChanged<String> onChangedEventFood;
  final ValueChanged<String> onChangedNumGuest;
  final VoidCallback onSavedEvent;
  ///constructor
   EventFormWidget({
    super.key,
    this.eventName = '',
    this.eventVenue = '',
    this.eventPhoto = '',
    this.eventFood = '',
    this.numGuest = '',
    required this.onChangedEventName,
    required this.onChangedEventVenue,
    required this.onChangedEventPhoto,
    required this.onChangedEventFood,
    required this.onChangedNumGuest,
    required this.onSavedEvent,
});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildEventName(),
        const SizedBox(height: 8),
        buildEventVenue(),
        const SizedBox(height: 8),
        buildEventPhoto(),
        const SizedBox(height: 8),
        buildEventFood(),
        const SizedBox(height: 8),
        buildNumGuest(),
        const SizedBox(height: 32),
        buildButton(),
      ],
    ),
  );
 ///builds the name text form field
 Widget buildEventName() => TextFormField(
   initialValue: eventName,
   onChanged: onChangedEventName,
   validator: (eventName){
     if(eventName!.isEmpty){
       return 'the name cannot be empty';
     }
     return null;
   },
   decoration: const InputDecoration(
     border: UnderlineInputBorder(),
     labelText: 'Event Name',
   ),
 );

  ///builds the venue text form field
 Widget buildEventVenue() => TextFormField(
   initialValue: eventVenue,
   onChanged: onChangedEventVenue,
   validator: (eventVenue){
     if(eventVenue!.isEmpty){
       return 'the venue cannot be empty';
     }
     return null;
   },
   decoration: const InputDecoration(
     border: UnderlineInputBorder(),
     labelText: 'Venue'
   ),
 );

  ///builds the photographer text form field
  Widget buildEventPhoto() => TextFormField(
    initialValue: eventPhoto,
    onChanged: onChangedEventPhoto,
    decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Photographer Name'
    ),
  );

  ///builds the caterer text form field
 Widget buildEventFood() => TextFormField(
   initialValue: eventFood,
   onChanged: onChangedEventFood,
   decoration: const InputDecoration(
       border: UnderlineInputBorder(),
       labelText: 'Caterer Name'
   ),
 );

  ///builds the number of guest text form field
 Widget buildNumGuest() => TextFormField(
   initialValue: numGuest,
   onChanged: onChangedNumGuest,
   decoration: const InputDecoration(
       border: UnderlineInputBorder(),
       labelText: 'Number of Guests'
   ),
 );

  ///builds the save button
 Widget buildButton() => SizedBox(
   width: double.infinity,
   child: ElevatedButton(
       onPressed: onSavedEvent,
     style: ButtonStyle(
       backgroundColor: MaterialStateProperty.all(Colors.black),
     ),
       child: const Text('Save Event',
       style: TextStyle(
           color: Colors.white
       ),),
   ),
 );


}
