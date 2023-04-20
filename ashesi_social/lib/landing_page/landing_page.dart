import 'package:ashesi_social/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ashesi_social/widgets/ashtales_appbar.dart';

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
      appBar: const ApplicationToolbar(),
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
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Login',
                        style: GoogleFonts.dancingScript(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 22, 81, 102),
                                fontSize: 60,
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
                          obscureText: true,
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
                          loginUser(
                              context, emailField.text, passwordField.text);
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
                        child: const Text('Submit'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                              color: Color.fromARGB(255, 22, 81, 102),
                              fontSize: 20,
                            )),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.manrope(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 22, 81, 102),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      )
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
