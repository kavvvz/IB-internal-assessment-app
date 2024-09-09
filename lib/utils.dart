import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Utils{
  ///shows snack bar when event is completed
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  ///changes value to datetime
  static DateTime toDateTime(Timestamp value){
    if(value == null) return DateTime(1);
    return value.toDate();
  }

  ///changes from datetime to Json to store in database
  static dynamic fromDateTimeToJson(DateTime date){
    if(date == null) return null;
    return date.toUtc();
  }
}