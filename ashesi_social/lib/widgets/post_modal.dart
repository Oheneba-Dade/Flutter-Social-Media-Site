import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ashesi_social/helpers/helper_functions.dart';
import 'package:ashesi_social/auth/login_auth.dart';
import 'package:provider/provider.dart';

class MyModal extends StatelessWidget {
  final TextEditingController createPostController = TextEditingController();

  MyModal({Key? key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {
                createPost(context, createPostController.text,
                    Provider.of<UserProvider>(context, listen: false).userEmail)
              },
              child: const Icon(Icons.check),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 22, 81, 102),
              ),
            ),
            const SizedBox(width: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/feed'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 22, 81, 102),
              ),
              child: const Icon(Icons.close),
            ),
          ],
        )
      ],
      //increase the width of the modal
      content: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: <Widget>[
            Text('Create Post',
                style: GoogleFonts.manrope(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 22, 81, 102),
                )),
            const Icon(Icons.draw,
                size: 50, color: Color.fromARGB(255, 22, 81, 102)),
            const SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 7,
              controller: createPostController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 22, 81, 102),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 22, 81, 102),
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
