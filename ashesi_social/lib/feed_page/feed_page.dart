import 'package:ashesi_social/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ashesi_social/auth/login_auth.dart';
import 'package:ashesi_social/widgets/ashtales_appbar.dart';
import 'package:ashesi_social/widgets/post_modal.dart';
import 'package:ashesi_social/widgets/posts.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  bool _isModalOpen = false;

  void _openModal() {
    setState(() {
      _isModalOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationToolbar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  right: BorderSide(
                    color: Color.fromARGB(255, 22, 81, 102),
                    width: 2,
                  ),
                )),
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 200),
                Center(
                    child: Text(context.watch<UserProvider>().firstName,
                        style: GoogleFonts.dancingScript(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 22, 81, 102),
                        ))),
                const SizedBox(height: 200),
                Row(
                  children: [
                    const SizedBox(width: 50),
                    const Icon(
                      Icons.person,
                      size: 40,
                      color: Color.fromARGB(255, 22, 81, 102),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          //set search user field to current user
                          searchUserField.text = context
                              .read<UserProvider>()
                              .userEmail
                              .toString()
                              .toLowerCase();
                          Navigator.pushNamed(context, '/viewProfile');
                        },
                        child: Text('View Profile',
                            style: GoogleFonts.manrope(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 22, 81, 102),
                            )))
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 50),
                    const Icon(
                      Icons.update,
                      size: 40,
                      color: Color.fromARGB(255, 22, 81, 102),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/editProfile');
                        },
                        child: Text('Update Profile',
                            style: GoogleFonts.manrope(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 22, 81, 102),
                            )))
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 50),
                    const Icon(
                      Icons.logout,
                      size: 40,
                      color: Color.fromARGB(255, 22, 81, 102),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          context.read<UserProvider>().clearUserInfo();
                          // clear all the controllers
                          emailField.clear();
                          passwordField.clear();
                          firstNameField.clear();
                          lastNameField.clear();
                          searchUserField.clear();
                          dateOfBirthField.clear();
                          bestFoodField.clear();
                          bestMovieField.clear();
                          yearGroupField.clear();
                          idNumberField.clear();
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text('Logout',
                            style: GoogleFonts.manrope(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 22, 81, 102),
                            )))
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Trending',
                              style: GoogleFonts.manrope(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 22, 81, 102),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.newspaper,
                            size: 40,
                            color: Color.fromARGB(255, 22, 81, 102),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // appropriately render the PostsList widget when it gets its data
                    Expanded(
                      child: PostsList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: Color.fromARGB(255, 22, 81, 102),
                    width: 2,
                  ),
                )),
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 200),
                Center(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text('Discover People',
                                style: GoogleFonts.manrope(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 22, 81, 102),
                                ))),
                        const Icon(
                          Icons.search,
                          size: 40,
                          color: Color.fromARGB(255, 22, 81, 102),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 500,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              style: GoogleFonts.manrope(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 22, 81, 102),
                              ),
                              controller: searchUserField,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Search for User by Email',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/viewProfile');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 22, 81, 102),
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Search',
                            style: GoogleFonts.manrope(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                )),
                const SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text('Create Post',
                                style: GoogleFonts.manrope(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 22, 81, 102),
                                ))),
                      ],
                    ),
                    Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          _openModal();
                        },
                        backgroundColor: const Color.fromARGB(255, 22, 81, 102),
                        child: const Icon(color: Colors.white, Icons.add),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _isModalOpen ? MyModal() : null,
    );
  }
}
