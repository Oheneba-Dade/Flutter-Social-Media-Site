import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationToolbar extends StatelessWidget with PreferredSizeWidget {
  const ApplicationToolbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          'AshTales (•_•)',
          style: GoogleFonts.dancingScript(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 22, 81, 102),
    );
  }
}
