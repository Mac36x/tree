/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/profile.dart';
import 'history.dart';
import 'comment.dart';
void main() => runApp(const historyPage());

class historyPage extends StatelessWidget {

const historyPage({Key? key}) : super(key: key);

// This widget is the root of your application.

@override

Widget build(BuildContext context) {

return MaterialApp(

title: 'Flutter Demo',

debugShowCheckedModeBanner: false,

theme: ThemeData(

primarySwatch: Colors.teal,

),

home: const MyHomePage(),

);

}

}

class MyHomePage extends StatelessWidget {

const MyHomePage({Key? key}) : super(key: key);

@override

Widget build(BuildContext context) {

return Scaffold(

appBar: AppBar(
backgroundColor: Color.fromARGB(255, 53, 248, 111),
title: const Text('history'),

),
drawer : Drawer(
    child : Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      /*DrawerHeader(
        child: Text('MENU'),
        decoration: BoxDecoration(
          color: Color.fromARGB(228, 246, 255, 85),
        ),
         ),*/
         UserAccountsDrawerHeader(
              accountName:  const Text('Thanawin'),
              accountEmail:  const Text('116310400255-0@mail.rmutt.ac.th'),
              currentAccountPicture: CircleAvatar(
                child: FlutterLogo(size: 42),
                backgroundColor: Colors.white,
              ),),
         ListTile(title: Text('Profile',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
          onTap: (){
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profilepage()));
          }),
         ListTile(
          title: Text('auspicious tree'),
          onTap: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
          },
         ),
         ListTile(
          title: Text('Training History'),
          onTap: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => historyPage()));
          },
         ),
          ListTile(
          title: Text('comment'),
          onTap: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Commentpage()));
          },
         ),
    ],
  ),
)),

body: const Center(

child: Text('Hello World'),

),

);

}

}
class GreenFrog extends StatelessWidget {

const GreenFrog({Key? key}) : super(key: key);

@override

Widget build(BuildContext context) {

return Container(

color: Colors.blue,

);

}

}*/