import 'package:ashesi_social/auth/login_auth.dart';
import 'package:ashesi_social/feed_page/feed_page.dart';
import 'package:flutter/material.dart';
import 'package:ashesi_social/landing_page/landing_page.dart';
import 'package:ashesi_social/signup_page/signup_page.dart';
import 'package:ashesi_social/edit_profile_page/edit_profile.dart';
import 'package:ashesi_social/auth/login_auth.dart';
import 'package:provider/provider.dart';
import 'package:ashesi_social/view_page/view_page.dart';

void main() {
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
            home: FeedPage(),
            routes: {
              '/signup': (context) => const SignUp(),
              '/login': (context) => const Login(),
              '/editProfile': (context) => const EditProfile(),
              '/viewProfile': (context) => const ViewProfile(),
            }));
  }
}
