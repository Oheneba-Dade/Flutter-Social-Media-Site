import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ashesi_social/functions/helper_functions.dart';
import 'package:ashesi_social/constants/constants.dart';
import 'package:ashesi_social/widgets/ashtales_appbar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpPage createState() => SignUpPage();
}

class SignUpPage extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ApplicationToolbar(),
        body: Stack(
          children: [
            Padding(
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
                                  height: 550,
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Sign Up',
                                  style: GoogleFonts.dancingScript(
                                      textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 22, 81, 102),
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
                                            color: Color.fromARGB(
                                                255, 22, 81, 102),
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
                                            color: Color.fromARGB(
                                                255, 22, 81, 102),
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
                                            color: Color.fromARGB(
                                                255, 22, 81, 102),
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
                                            color: Color.fromARGB(
                                                255, 22, 81, 102),
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
                                          color:
                                              Color.fromARGB(255, 22, 81, 102),
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
                                        items: majorDropDownItems,
                                        onChanged: (value) => {
                                          majorField = value as String,
                                        },
                                        style: GoogleFonts.manrope(
                                            textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 22, 81, 102),
                                          height: 2,
                                        )),
                                        decoration: InputDecoration(
                                            labelText: 'Major',
                                            labelStyle: GoogleFonts.manrope(
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
                                      child: FormBuilderTextField(
                                        name: 'year_group',
                                        controller: yearGroupField,
                                        style: GoogleFonts.manrope(
                                            textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 22, 81, 102),
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
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 320,
                                        child: FormBuilderTextField(
                                          obscureText: true,
                                          name: 'password',
                                          controller: passwordField,
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 22, 81, 102),
                                            height: 2,
                                          )),
                                          decoration: InputDecoration(
                                              labelText: 'Password',
                                              hintStyle: GoogleFonts.manrope(
                                                  textStyle: const TextStyle(
                                                color: Colors.grey,
                                              ))),
                                        )),
                                    const SizedBox(
                                      width: 160,
                                    ),
                                    SizedBox(
                                        width: 250,
                                        child: FormBuilderDropdown(
                                          name: "residenceStatus",
                                          items: residenceStatusDropDownItems,
                                          onChanged: (value) => {
                                            residenceStatusField =
                                                value as String
                                          },
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 22, 81, 102),
                                            height: 2,
                                          )),
                                          decoration: InputDecoration(
                                              labelText: 'Residence Status',
                                              labelStyle: GoogleFonts.manrope(
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
                                          name: 'best_food',
                                          controller: bestFoodField,
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 22, 81, 102),
                                            height: 2,
                                          )),
                                          decoration: InputDecoration(
                                              labelText: 'Best Food',
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
                                          name: 'best_movie',
                                          controller: bestMovieField,
                                          style: GoogleFonts.manrope(
                                              textStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 22, 81, 102),
                                            height: 2,
                                          )),
                                          decoration: InputDecoration(
                                              labelText: 'Best Movie',
                                              hintStyle: GoogleFonts.manrope(
                                                  textStyle: const TextStyle(
                                                color: Colors.grey,
                                              ))),
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    postProfileData(
                                        context,
                                        firstNameField.text,
                                        lastNameField.text,
                                        emailField.text,
                                        idNumberField.text,
                                        dateOfBirthField.text,
                                        majorField,
                                        yearGroupField.text,
                                        passwordField.text,
                                        residenceStatusField,
                                        bestFoodField.text,
                                        bestMovieField.text);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(175, 65),
                                    backgroundColor:
                                        const Color.fromARGB(255, 22, 81, 102),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    textStyle: GoogleFonts.manrope(
                                        textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    )),
                                  ),
                                  child: const Text('Create Account'),
                                )
                              ],
                            )
                          ],
                        )))),
          ],
        ));
  }
}
