import 'package:flutter/material.dart';

final TextEditingController emailField = TextEditingController();
final TextEditingController passwordField = TextEditingController();
final TextEditingController firstNameField = TextEditingController();
final TextEditingController lastNameField = TextEditingController();
final TextEditingController idNumberField = TextEditingController();
final TextEditingController dateOfBirthField = TextEditingController();
final TextEditingController yearGroupField = TextEditingController();
final TextEditingController bestFoodField = TextEditingController();
final TextEditingController bestMovieField = TextEditingController();

String majorField = "";
String residenceStatusField = "";

List<DropdownMenuItem<String>> majorDropDownItems = [
  const DropdownMenuItem(
    value: "Computer Science",
    child: Text("Computer Science"),
  ),
  const DropdownMenuItem(
    value: "Business Administration",
    child: Text("Business Administration"),
  ),
  const DropdownMenuItem(
    value: "Management Information Systems",
    child: Text("Management Information Systems"),
  ),
  const DropdownMenuItem(
    value: "Electrical Engineering",
    child: Text("Electrical Engineering"),
  ),
  const DropdownMenuItem(
    value: "Computer Engineering",
    child: Text("Computer Engineering"),
  ),
  const DropdownMenuItem(
    value: "Mechanical Engineering",
    child: Text("Mechanical Engineering"),
  ),
];

List<DropdownMenuItem<String>> residenceStatusDropDownItems = [
  const DropdownMenuItem(
    value: "On Campus",
    child: Text("On Campus"),
  ),
  const DropdownMenuItem(
    value: "Off Campus",
    child: Text("Off Campus"),
  ),
];
