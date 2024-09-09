library globals;

import 'package:flutter/cupertino.dart';
DateTime selectedDatePassed = DateTime.now();
DateTime today = DateTime.now();
String username = '';
late DateTime createdDate;
//email address of admin
String admin = 'netrprabha.charucharoen@gmail.com';
//email address of co-admin
String coAdmin = 'kavinna.kohsamui@gmail.com';
//after comparing, their status (admin || co-admin || team member will be stored here
String defineStatus = '';
//global variable to take the text from email controller to be compared to the other strings
String email = '';

