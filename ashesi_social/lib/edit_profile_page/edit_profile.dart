import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ashesi_social/helpers/helper_functions.dart';
import 'package:ashesi_social/constants/constants.dart';
import 'package:ashesi_social/auth/login_auth.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  EditProfilePage createState() => EditProfilePage();
}

class EditProfilePage extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> userProfile = getProfileData(
        Provider.of<UserProvider>(context, listen: false).userEmail);

    userProfile.then((value) {
      firstNameField.text = value['firstName'];
      lastNameField.text = value['lastName'];
      emailField.text = value['email'];
      idNumberField.text = value['idNumber'];
      dateOfBirthField.text = value['dateOfBirth'];
      majorField = value['major'];
      yearGroupField.text = value['yearGroup'];
      passwordField.text = value['password'];
      residenceStatusField = value['residenceStatus'];
      bestFoodField.text = value['bestFood'];
      bestMovieField.text = value['bestMovie'];
    });

    var majorIndex = 0;
    var residenceStatusIndex = 0;
    for (int i = 0; i < majorDropDownItems.length; i++) {
      if (majorDropDownItems[i].value == majorField) {
        majorIndex = i;
      }
    }
    for (int i = 0; i < residenceStatusDropDownItems.length; i++) {
      if (residenceStatusDropDownItems[i].value == majorField) {
        residenceStatusIndex = i;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'AshTales🎤',
            style: GoogleFonts.dancingScript(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 22, 81, 102),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Row(
              children: [
                Column(children: [
                  Image.asset(
                    'images/edit_page.png',
                    width: 600,
                    height: 600,
                  ),
                ]),
                Column(
                  children: [
                    Text(
                      'Edit Profile',
                      style: GoogleFonts.dancingScript(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 22, 81, 102),
                              fontSize: 60,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 350,
                            child: FormBuilderTextField(
                              name: 'first_name',
                              controller: firstNameField,
                              enabled: false,
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
                              enabled: false,
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
                              enabled: false,
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
                              enabled: false,
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
                            items: majorDropDownItems,
                            initialValue: majorDropDownItems[majorIndex].value,
                            onChanged: (value) => {
                              majorField = value as String,
                            },
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                              color: Color.fromARGB(255, 22, 81, 102),
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
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 150,
                            child: FormBuilderDropdown(
                              name: "residenceStatus",
                              items: residenceStatusDropDownItems,
                              initialValue: residenceStatusDropDownItems[
                                      residenceStatusIndex]
                                  .value,
                              onChanged: (value) =>
                                  {residenceStatusField = value as String},
                              style: GoogleFonts.manrope(
                                  textStyle: const TextStyle(
                                color: Color.fromARGB(255, 22, 81, 102),
                                height: 2,
                              )),
                              decoration: InputDecoration(
                                  labelText: 'Residence Status',
                                  labelStyle: GoogleFonts.manrope(
                                      textStyle: const TextStyle(
                                    color: Colors.grey,
                                  ))),
                            )),
                        const SizedBox(
                          width: 40,
                        ),
                        SizedBox(
                            width: 250,
                            child: FormBuilderTextField(
                              name: 'best_food',
                              controller: bestFoodField,
                              style: GoogleFonts.manrope(
                                  textStyle: const TextStyle(
                                color: Color.fromARGB(255, 22, 81, 102),
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
                            width: 250,
                            child: FormBuilderTextField(
                              name: 'best_movie',
                              controller: bestMovieField,
                              style: GoogleFonts.manrope(
                                  textStyle: const TextStyle(
                                color: Color.fromARGB(255, 22, 81, 102),
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
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            updateProfileData(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            textStyle: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                          ),
                          child: const Text('Update'),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
