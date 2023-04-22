import 'package:ashesi_social/auth/login_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

var headers = {'Content-Type': 'application/json'};

Future<void> loginUser(
    BuildContext context, String email, String password) async {
  String url = "http://127.0.0.1:5000/users/auth";
  var request = http.Request('POST', Uri.parse(url));

  request.body = json.encode({"email": email, "password": password});
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/feed');
    final loginResponse = jsonDecode(await response.stream.bytesToString());
    // ignore: use_build_context_synchronously
    Provider.of<UserProvider>(context, listen: false)
        .setUserEmail(loginResponse['email']);

    Provider.of<UserProvider>(context, listen: false)
        .setFirstName(loginResponse['firstName']);
    // ignore: use_build_context_synchronously, unused_local_variable
  } else {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Failed"),
            content: Text("You have not been logged in"),
          );
        });
  }
}

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
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "idNumber": idNumber,
    "dateOfBirth": dateOfBirth,
    "major": major,
    "yearGroup": yearGroup,
    "password": password,
    "residenceStatus": residenceStatus,
    "bestFood": bestFood,
    "bestMovie": bestMovie
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/login');
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

Future<Map<String, dynamic>> getProfileData(String email) async {
  String url = "http://127.0.0.1:5000/users";
  var uri = Uri.parse(url).replace(queryParameters: {"email": email});
  var request = http.Request('GET', uri);

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  // if (response.statusCode == 200) {
  //   var data = await response.stream.bytesToString();
  //   return json.decode(data);
  // } else {
  //   return {
  //     "message": "Failed to get profile data",
  //   };
  // }
  var data = await response.stream.bytesToString();
  return json.decode(data);
}

Future<void> updateProfileData(
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
  String url = "http://127.0.0.1:5000/users/";
  url += Provider.of<UserProvider>(context, listen: false).userEmail;
  var request = http.Request('PATCH', Uri.parse(url));

  request.body = json.encode({
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "idNumber": idNumber,
    "dateOfBirth": dateOfBirth,
    "major": major,
    "yearGroup": yearGroup,
    "password": password,
    "residenceStatus": residenceStatus,
    "bestFood": bestFood,
    "bestMovie": bestMovie
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
            content: Text("Your profile has been updated"),
          );
        });
  } else {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Failed"),
            content: Text("Your profile has not been updated"),
          );
        });
  }
}

Future<void> createPost(
    BuildContext context, String content, String email) async {
  String url = "http://127.0.0.1:5000/posts";
  var request = http.Request('POST', Uri.parse(url));

  request.body = json.encode({"content": content, "email": email});
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/feed');
  } else {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Failed"),
            content: Text("Your post has not been created"),
          );
        });
  }
}
