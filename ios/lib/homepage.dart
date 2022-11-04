import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/aquarius.dart';
import 'package:flutter_application_1/aries.dart';
import 'package:flutter_application_1/cancer.dart';
import 'package:flutter_application_1/capricorn.dart';
import 'package:flutter_application_1/comment.dart';
import 'package:flutter_application_1/gemini.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/libra.dart';
import 'package:flutter_application_1/pisces.dart';
import 'package:flutter_application_1/sagittarius.dart';
import 'package:flutter_application_1/scorpio.dart';
import 'package:flutter_application_1/taurus.dart';
import 'package:flutter_application_1/virgo.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'history.dart';
import 'package:flutter_application_1/homepage.dart';
import 'profile.dart';
import 'package:flutter_application_1/leo.dart';

final name = FirebaseAuth.instance;

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final auth = FirebaseAuth.instance;
  File? _avatar; //เพิ่มถ่าย+เปลี่ยนรูปส่วนที่1
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: GradientText(
          "TREE",
          style: GoogleFonts.gochiHand(fontSize: 30),
          gradient: LinearGradient(colors: [
            Colors.red,
            Colors.pink,
            Colors.purple,
            Colors.deepPurple,
            Colors.deepPurple,
            Colors.indigo,
            Colors.blue,
            Colors.lightBlue,
            Colors.cyan,
            Colors.teal,
            Colors.green,
            Colors.lightGreen,
            Colors.lime,
            Colors.yellow,
            Colors.amber,
            Colors.orange,
            Colors.deepOrange,
          ]),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      drawer: Drawer(
          child: Drawer(
        //backgroundImage: AssetImage('assets/images/Gemini.png'),
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
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 125, 95),
                ),
                accountName: const Text(''),
                accountEmail: Text(
                  name.currentUser!.email!,
                  style: GoogleFonts.gochiHand(fontSize: 15),
                ),
                currentAccountPicture:
                    _avatar == null //เพิ่มถ่าย+เปลี่ยนรูปส่วนที่2
                        ? GestureDetector(
                            onTap: () {
                              onChooseImage();
                            },
                            child: CircleAvatar(),
                          )
                        : GestureDetector(
                            onTap: () {
                              onChooseImage();
                            },
                            child: Image.file(
                              _avatar!,
                              fit: BoxFit.cover,
                            ),
                          )),
            //   currentAccountPicture: CircleAvatar(
            //     child: Icon(
            //       Icons.person,
            //       size: (42),
            //     ),
            //     backgroundColor: Colors.black12,
            //   ),
            // ),
            ListTile(
                title: Text(
                  'Profile',
                  style: GoogleFonts.gochiHand(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/profilepage');
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => profilepage()));
                }),
            ListTile(
              title: Text(
                'Zodiac Tree',
                style: GoogleFonts.gochiHand(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
            ),
            ListTile(
              title: Text(
                'comment',
                style: GoogleFonts.gochiHand(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CommentPage()));
              },
            ),
          ],
        ),
      )),
      body: Form(
        child: Container(
          color: Color.fromARGB(255, 248, 255, 247),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/lucky-plants-12-1.jpg'),
                ),
                title: Text(
                  'ราศีธนู',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sagittariuspage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Aries.png'),
                ),
                title: Text(
                  'ราศีมังกร',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ariespage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Taurus.png'),
                ),
                title: Text(
                  'ราศีกุมภ์',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => tauruspage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Pisces.png'),
                ),
                title: Text(
                  'ราศีมีน',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => piscespage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Aquarius.png'),
                ),
                title: Text(
                  'ราศีเมษ',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => aquariuspage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Capricorn.png'),
                ),
                title: Text(
                  'ราศีพฤษก',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => capricornpage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Gemini.png')),
                title: Text(
                  'ราศีเมถุน',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => geminipage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/lucky-plants-7-1.jpg')),
                title: Text(
                  'ราศีกรกฎ ',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => cancerpage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/lucky-plants-8-1.jpg'),
                ),
                title: Text(
                  'ราศีสิงห์',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => leopage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/lucky-plants-9-1.jpg'),
                ),
                title: Text(
                  'ราศีกันย์',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => virgopage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/lucky-plants-10-1.jpg'),
                ),
                title: Text(
                  'ราศีตุลย์',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => librapage()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/lucky-plants-11-1.jpg'),
                ),
                title: Text(
                  'ราศีพิจิก',
                  style: GoogleFonts.sriracha(fontSize: 18),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => scorpiopage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  onChooseImage() async {
    //เพิ่มถ่าย+เปลี่ยนรูปส่วนที่3
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _avatar = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
