import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/history.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/register.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_comment.dart';
import 'profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),

        '/register': (context) => RegisterPage(),

        '/homepage': (context) => Homepage(),
//'history' : (context) => historyPage(),
        '/add_comment': (context) => AddCommentPage(),
        '/profilepage': (context) => profilepage(),
      },
    );
  }
}
