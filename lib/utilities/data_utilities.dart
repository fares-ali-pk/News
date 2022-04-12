import 'package:flutter/material.dart';

Widget loading() {
  return Container(
    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget noData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("No Data Available"),
  );
}

Widget noEnoughData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("There Isn't Enough Data"),
  );
}

Widget error(var error){
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(error.toString()),
  );
}

Widget connectionError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("Connectoin Error!!!"),
  );
}