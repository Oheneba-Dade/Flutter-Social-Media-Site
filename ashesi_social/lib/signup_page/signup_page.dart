import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpPage createState() => SignUpPage();
}

final TextEditingController emailField = TextEditingController();
final TextEditingController passwordField = TextEditingController();
final TextEditingController firstNameField = TextEditingController();
final TextEditingController lastNameField = TextEditingController();
final TextEditingController idNumberField = TextEditingController();
final TextEditingController dateOfBirthField = TextEditingController();
final TextEditingController yearGroupField = TextEditingController();
final TextEditingController majorField = TextEditingController();
final TextEditingController residenceStatusField = TextEditingController();
final TextEditingController bestFoodField = TextEditingController();
final TextEditingController bestMovieField = TextEditingController();

List<DropdownMenuItem<String>> _dropdownItems = [
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

class SignUpPage extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
                child: SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'images/signup_banner.png',
                              width: 600,
                              height: 650,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              'Sign Up',
                              style: GoogleFonts.dancingScript(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 22, 81, 102),
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: 350,
                                    child: FormBuilderTextField(
                                      name: 'first_name',
                                      controller: firstNameField,
                                      style: GoogleFonts.manrope(
                                          textStyle: const TextStyle(
                                        color: Color.fromARGB(255, 22, 81, 102),
                                        height: 2,
                                      )),
                                      decoration: InputDecoration(
                                          labelText: 'First Name',
                                          hintStyle: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                            color: Colors.grey,
                                          ))),
                                    )),
                                const SizedBox(
                                  width: 40,
                                ),
                                SizedBox(
                                    width: 350,
                                    child: FormBuilderTextField(
                                      name: 'last_name',
                                      controller: lastNameField,
                                      style: GoogleFonts.manrope(
                                          textStyle: const TextStyle(
                                        color: Color.fromARGB(255, 22, 81, 102),
                                        height: 2,
                                      )),
                                      decoration: InputDecoration(
                                          labelText: 'Last Name',
                                          hintStyle: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                            color: Colors.grey,
                                          ))),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: 350,
                                    child: FormBuilderTextField(
                                      name: 'email',
                                      controller: emailField,
                                      style: GoogleFonts.manrope(
                                          textStyle: const TextStyle(
                                        color: Color.fromARGB(255, 22, 81, 102),
                                        height: 2,
                                      )),
                                      decoration: InputDecoration(
                                          labelText: 'Email Address',
                                          hintStyle: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                            color: Colors.grey,
                                          ))),
                                    )),
                                const SizedBox(
                                  width: 40,
                                ),
                                SizedBox(
                                    width: 350,
                                    child: FormBuilderTextField(
                                      name: 'id_number',
                                      controller: idNumberField,
                                      style: GoogleFonts.manrope(
                                          textStyle: const TextStyle(
                                        color: Color.fromARGB(255, 22, 81, 102),
                                        height: 2,
                                      )),
                                      decoration: InputDecoration(
                                          labelText: 'ID Number',
                                          hintStyle: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                            color: Colors.grey,
                                          ))),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: FormBuilderDateTimePicker(
                                    inputType: InputType.date,
                                    name: 'date_of_birth',
                                    controller: dateOfBirthField,
                                    style: GoogleFonts.manrope(
                                        textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 22, 81, 102),
                                      height: 2,
                                    )),
                                    decoration: InputDecoration(
                                        labelText: 'Date of Birth',
                                        hintStyle: GoogleFonts.manrope(
                                            textStyle: const TextStyle(
                                          color: Colors.grey,
                                        ))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 90,
                                ),
                                SizedBox(
                                  width: 250,
                                  child: FormBuilderDropdown(
                                    name: 'major',
                                    items: _dropdownItems,
                                    style: GoogleFonts.manrope(
                                        textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 22, 81, 102),
                                      height: 2,
                                    )),
                                    decoration: InputDecoration(
                                        labelText: 'Major',
                                        hintStyle: GoogleFonts.manrope(
                                            textStyle: const TextStyle(
                                          color: Colors.grey,
                                        ))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 90,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: FormBuilderDateTimePicker(
                                    inputType: InputType.date,
                                    name: 'year_group',
                                    controller: yearGroupField,
                                    style: GoogleFonts.manrope(
                                        textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 22, 81, 102),
                                      height: 2,
                                    )),
                                    decoration: InputDecoration(
                                        labelText: 'Year Group',
                                        hintStyle: GoogleFonts.manrope(
                                            textStyle: const TextStyle(
                                          color: Colors.grey,
                                        ))),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )))));
  }
}
