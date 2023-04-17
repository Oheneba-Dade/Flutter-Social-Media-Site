import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LandingPage createState() => LandingPage();
}

final TextEditingController emailField = TextEditingController();
final TextEditingController passwordField = TextEditingController();

class LandingPage extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/landing_page_hero.png',
                        width: 800,
                        height: 600,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to AshTales',
                        style: GoogleFonts.dancingScript(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 22, 81, 102),
                                fontSize: 60,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Login',
                        style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 22, 81, 102),
                                fontSize: 45,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 400,
                        child: FormBuilderTextField(
                          name: 'email',
                          controller: emailField,
                          style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                            color: Color.fromARGB(255, 22, 81, 102),
                            height: 2,
                          )),
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintStyle: GoogleFonts.manrope(
                                  textStyle: const TextStyle(
                                color: Colors.grey,
                              ))),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 400,
                        child: FormBuilderTextField(
                          name: 'password',
                          controller: passwordField,
                          style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                            color: Color.fromARGB(255, 22, 81, 102),
                            height: 2,
                          )),
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintStyle: GoogleFonts.manrope(
                                  textStyle: const TextStyle(
                                color: Colors.grey,
                              ))),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print(emailField.text);
                          print(passwordField.text);
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
                        child: const Text('Let Me In!'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}