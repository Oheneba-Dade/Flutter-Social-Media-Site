import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var headers = {'Content-Type': 'application/json'};

Future<void> postProfileData(
    BuildContext context,
    String firstName,
    String lastName,
    String email,
    String idNumber,
    String dateOfBirth,
    String major,
    String yearGroup,
    String password,
    String residenceStatus,
    String bestFood,
    String bestMovie) async {
  String url = "http://127.0.0.1:5000/users";
  var request = http.Request('POST', Uri.parse(url));

  request.body = json.encode({
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "id_number": idNumber,
    "date_of_birth": dateOfBirth,
    "major": major,
    "year_group": yearGroup,
    "password": password,
    "residence_status": residenceStatus,
    "best_food": bestFood,
    "best_movie": bestMovie
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Success"),
            content: Text("Your profile has been created"),
          );
        });
  } else if (response.statusCode == 409) {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("ID or Email already exists"),
            content: Text("A user with this information already exists"),
          );
        });
  } else {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Failed"),
            content: Text("Your profile has not been created"),
          );
        });
  }
}
