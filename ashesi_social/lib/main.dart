import 'package:ashesi_social/auth/login_auth.dart';
import 'package:ashesi_social/feed_page/feed_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ashesi_social/landing_page/landing_page.dart';
import 'package:ashesi_social/signup_page/signup_page.dart';
import 'package:ashesi_social/edit_profile_page/edit_profile.dart';
import 'package:provider/provider.dart';
import 'package:ashesi_social/view_page/view_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAW3iHZYQBDB4S6TSUl_f_rjCbeTse0sLk",
          appId: "1:844155377072:web:480362cf9934474e7bb275",
          messagingSenderId: "844155377072",
          projectId: "ashesi-social"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Ashesi Social',
            home: const Login(),
            routes: {
              '/signup': (context) => const SignUp(),
              '/login': (context) => const Login(),
              '/editProfile': (context) => const EditProfile(),
              '/viewProfile': (context) => const ViewProfile(),
              '/feed': (context) => const FeedPage(),
            }));
  }
}
