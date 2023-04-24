import 'package:ashesi_social/auth/login_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

var headers = {
  'Content-Type': 'application/json',
  'Access-Control-Allow-Origin': '*'
};
String baseURL =
    "https://us-central1-ashesi-social.cloudfunctions.net/social_api";

/// This function logs in a user by sending a POST request to a specified URL with the user's email and
/// password, and then sets the user's email and first name using Provider.
///
/// Args:
///   context (BuildContext): The BuildContext is a reference to the location of a widget within the
/// widget tree. It is used to access the theme, media query, and other properties of the parent widget.
/// In this case, it is used to navigate to a new screen and display an alert dialog.
///   email (String): The email of the user trying to log in.
///   password (String): A string variable that represents the user's password.
///
/// Returns:
///   a `Future<void>`.
Future<void> loginUser(
    BuildContext context, String email, String password) async {
  String url = "$baseURL/users/auth";
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

    // ignore: use_build_context_synchronously
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

/// This function sends a POST request to a server with user profile data and handles the response
/// accordingly.
///
/// Args:
///   context (BuildContext): A BuildContext object that represents the location of the widget in the
/// widget tree where the function is being called from.
///   firstName (String): The first name of the user.
///   lastName (String): The last name of the user.
///   email (String): The email of the user creating the profile.
///   idNumber (String): The identification number of the user.
///   dateOfBirth (String): The date of birth of the user in the format of a string.
///   major (String): The field for the user's major or area of study.
///   yearGroup (String): The year group of the user, typically referring to their academic year or
/// level of study.
///   password (String): The password of the user's account.
///   residenceStatus (String): The parameter "residenceStatus" is a string that represents the current
/// living situation of the user, such as "On-campus", "Off-campus", or "Living with family".
///   bestFood (String): A string representing the user's favorite food.
///   bestMovie (String): A string representing the user's favorite movie.
///
/// Returns:
///   a `Future<void>`.
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
  String url = "$baseURL/users";
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

/// This function sends a GET request to a specified URL with a query parameter of email and returns the
/// decoded JSON response as a Future.
///
/// Args:
///   email (String): The email parameter is a string that represents the email address of the user
/// whose profile data is being requested.
///
/// Returns:
///   A Future object that resolves to a Map<String, dynamic> containing profile data for the user with
/// the specified email address.
Future<Map<String, dynamic>> getProfileData(String email) async {
  String url = "$baseURL/users";
  var uri = Uri.parse(url).replace(queryParameters: {"email": email});
  var request = http.Request('GET', uri);

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var data = await response.stream.bytesToString();
  return json.decode(data);
}

/// This function updates user profile data by sending a PATCH request to a specified URL and displays a
/// success or failure dialog based on the response status code.
///
/// Args:
///   context (BuildContext): A BuildContext object that represents the location of the widget in the
/// widget tree. It is used to access the current state of the widget and to build widgets within the
/// context of the current widget.
///   firstName (String): A string representing the user's first name.
///   lastName (String): A string representing the last name of the user.
///   email (String): The email of the user whose profile data is being updated.
///   idNumber (String): The identification number of the user, which could be a unique identifier
/// assigned by an organization or government.
///   dateOfBirth (String): A string representing the date of birth of the user in the format
/// "YYYY-MM-DD".
///   major (String): The field for the user's major or area of study.
///   yearGroup (String): A string representing the year group of the user, such as "Freshman",
/// "Sophomore", "Junior", or "Senior".
///   password (String): The password parameter is a string that represents the user's password. It is
/// used to update the user's password in their profile data.
///   residenceStatus (String): A string representing the user's current residence status, such as
/// "On-campus", "Off-campus", or "Commuter".
///   bestFood (String): A string representing the user's favorite food.
///   bestMovie (String): A string representing the user's favorite movie.
///
/// Returns:
///   a `Future<void>`.
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
  String url = "$baseURL/users/";
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

/// This function sends a POST request to create a new post with content and email, and navigates to the
/// feed page if successful or shows an error dialog if unsuccessful.
///
/// Args:
///   context (BuildContext): The BuildContext of the current widget tree. It is used to navigate to the
/// feed screen or show an error dialog.
///   content (String): The content of the post that the user wants to create.
///   email (String): The email of the user creating the post.
///
/// Returns:
///   a `Future<void>`.
Future<void> createPost(
    BuildContext context, String content, String email) async {
  String url = "$baseURL/posts";
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
