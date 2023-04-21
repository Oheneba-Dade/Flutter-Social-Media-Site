import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ashesi_social/auth/login_auth.dart';
import 'package:ashesi_social/widgets/ashtales_appbar.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
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
                    child: Text('Oheneba',
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
                      color: const Color.fromARGB(255, 22, 81, 102),
                    ),
                    const SizedBox(width: 10),
                    Text('View Profile',
                        style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 22, 81, 102),
                        ))
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 50),
                    const Icon(
                      Icons.logout,
                      size: 40,
                      color: const Color.fromARGB(255, 22, 81, 102),
                    ),
                    const SizedBox(width: 10),
                    Text('Logout',
                        style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 22, 81, 102),
                        ))
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Column 2',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 22, 81, 102),
                    ),
                  ),
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
                const Center(
                  child: Text(
                    'Essentials',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 22, 81, 102),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 200),
                Row(
                  children: [
                    const SizedBox(width: 150),
                    Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        backgroundColor: Colors.white,
                        child: const Icon(
                            color: const Color.fromARGB(255, 22, 81, 102),
                            Icons.add),
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
    );
  }
}
