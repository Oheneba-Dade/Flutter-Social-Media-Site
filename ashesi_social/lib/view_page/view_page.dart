import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ashesi_social/widgets/ashtales_appbar.dart';
import 'package:ashesi_social/constants/constants.dart';
import 'package:ashesi_social/functions/helper_functions.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  ViewProfilePage createState() => ViewProfilePage();
}

class ViewProfilePage extends State<ViewProfile> {
  String firstName = "";
  String lastName = "";
  String idNumber = "";
  String email = "";
  String dob = "";
  String major = "";
  String residence = "";
  String yearGroup = "";
  String bestFood = "";
  String bestMovie = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getProfileData(searchUserField.text),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data == null) {
            return const Scaffold(
              appBar: ApplicationToolbar(),
              body: Center(
                child: Text('No data found'),
              ),
            );
          } else {
            firstName = snapshot.data!['firstName'] ?? "";
            lastName = snapshot.data!['lastName'] ?? "";
            idNumber = snapshot.data!['idNumber'] ?? "";
            email = snapshot.data!['email'] ?? "";
            dob = snapshot.data!['dateOfBirth'] ?? "";
            major = snapshot.data!['major'] ?? "";
            residence = snapshot.data!['residenceStatus'] ?? "";
            yearGroup = snapshot.data!['yearGroup'] ?? "";
            bestFood = snapshot.data!['bestFood'] ?? "";
            bestMovie = snapshot.data!['bestMovie'] ?? "";
          }
          return Scaffold(
            appBar: const ApplicationToolbar(),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(
                      'images/view_avatar.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.person, color: Colors.black),
                        const SizedBox(width: 10),
                        Text(
                          '$firstName $lastName',
                          style: GoogleFonts.dancingScript(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 22, 81, 102),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.numbers, color: Colors.black),
                        const SizedBox(width: 10),
                        Text(
                          idNumber,
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 22, 81, 102),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.mail, color: Colors.black),
                              const SizedBox(width: 10),
                              Text(
                                email,
                                style: GoogleFonts.manrope(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 22, 81, 102),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.calendar_month, color: Colors.black),
                        const SizedBox(width: 10),
                        Text(
                          dob,
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 22, 81, 102),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.book, color: Colors.black),
                              const SizedBox(width: 10),
                              Text(
                                major,
                                style: GoogleFonts.manrope(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 22, 81, 102),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.house, color: Colors.black),
                        const SizedBox(width: 10),
                        Text(
                          residence,
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 22, 81, 102),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.access_time,
                                  color: Colors.black),
                              const SizedBox(width: 10),
                              Text(
                                yearGroup,
                                style: GoogleFonts.manrope(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 22, 81, 102),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.local_pizza, color: Colors.black),
                        const SizedBox(width: 10),
                        Text(
                          bestFood,
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 22, 81, 102),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.movie_outlined,
                                  color: Colors.black),
                              const SizedBox(width: 10),
                              Text(
                                bestMovie,
                                style: GoogleFonts.manrope(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 22, 81, 102),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
