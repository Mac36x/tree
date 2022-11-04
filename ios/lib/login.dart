/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formstate = GlobalKey<FormState>();
  String? email;
  String? password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: 
      PreferredSize( //wrap with PreferredSize
                preferredSize: Size.fromHeight(80), //height of appbar
                child: AppBar(
                  title:Center(child: Text("Auspicious Tree")),
                  
                   //appbar title
                  backgroundColor: Color.fromARGB(255, 69, 243, 0) //appbar background color
                )
          ),
      
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formstate,
        child: ListView(
          
          children: <Widget>[
            
            // Container(
            //   width: w,
            //   height: h*0.3,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //     image:AssetImage('assets/cartoon.jpg'),
            //     // fit: BoxFit.cover,
            //     alignment: Alignment.center,
            //     )
            //   ),
            // ),
            Container(
          
              margin: EdgeInsets.only(left: 20,right: 20,top: 10),
              width: w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                // ignore: prefer_const_constructors
                  Text('Login',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Card(child: Image(image: AssetImage('assets/images/capricorn.jpg')),),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text('Email',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                      const SizedBox(height: 10,),
                      emailTextFormField(),
                      const SizedBox(height: 10,),
                      const Text('Password',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 10,),
                      passwordTextFormField(),
                      ],
                    ),
                  ),
                  button(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                    ],
                  ),
                  Container(
                     margin: EdgeInsets.only(left: 20,right: 20,top: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    
                      children: [
                        
                        const Text("Don't have account?     ",
                          style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                        registerButton( context),
                      ],
                    ),
                  ),

                const SizedBox(height: 10,),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  ElevatedButton button() {
    return ElevatedButton(
          onPressed: () async {
          if (_formstate.currentState!.validate()) {
            print('Valid Form');
            _formstate.currentState!.save();
            try {
              await auth
                  .signInWithEmailAndPassword(
                      email: email!, password: password!)
                  .then((value) {
                if (value.user!.emailVerified) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Pass")));
                      Navigator.pushNamed(context, '/homepage');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please verify email")));
                }
              }).catchError((reason) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login or Password Invalid")));
              });
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
              }
            }
          } else
            print('Invalid Form');
        },
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        );
  }

  ElevatedButton forgetPasswordButton(BuildContext context) {
    return ElevatedButton(
      // ignore: prefer_const_constructors
      child: Text('Forget Password?',
        style: TextStyle(
          color: Color.fromARGB(255, 216,78,78)
          ),
        ),
      onPressed: () {
        // print('Goto  Regis pagge');
        Navigator.pushNamed(context, '/forgetPasswordPage');
      },
    );
  }
  ElevatedButton registerButton(BuildContext context) {
    return ElevatedButton(
      // ignore: prefer_const_constructors
      child: Text('Register Now',
        style: TextStyle(
          color: Color.fromARGB(255, 216,78,78)
          ),
        ),
      onPressed: () {
        print('Goto  Regis pagge');
        Navigator.pushNamed(context, '/register');
      },
    );
  }


  TextFormField passwordTextFormField() {
    return TextFormField(
      onSaved: (value) {
        password = value!.trim();
      },
      validator: (value) {
        if (value!.length < 8)
          return 'Please Enter more than 8 Character';
        else
          return null;
      },
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration:  InputDecoration(
        labelText: 'Password',
          // icon: const Icon(Icons.lock),
        hintText: ('Password'),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        )
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      onSaved: (value) {
        email = value!.trim();
      },
      validator: (value) {
        if (!validateEmail(value!))
          return 'Please fill in E-mail field';
        else
          return null;
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
     decoration: InputDecoration(
        labelText: ('E-mail'),
        // icon: const Icon(Icons.email),
        hintText: ('aaaa@mail'),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        )
      ),
    );
  }

  bool validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return (!regex.hasMatch(value)) ? false : true;
  }
}



















import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart'; //
import 'package:firebase_auth/firebase_auth.dart'; //
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart'; //
import 'package:google_fonts/google_fonts.dart'; //
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_1/homepage.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formstate = GlobalKey<FormState>();
  String? email;
  String? password;

  int _counter = 0;
  String? message;
  String channelId = "1000";
  String channelName = "FLUTTER_NOTIFICATION_CHANNEL";
  String channelDescription = "FLUTTER_NOTIFICATION_CHANNEL_DETAIL";
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  final auth = FirebaseAuth.instance;

  @override
  initState() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('notiicon');

    var initializationSettingsIOS = DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) async {
      print("onDidReceiveLocalNotification called.");
    });

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) async {
      // when user tap on notification.
      print("onSelectNotification called.");
      setState(() {
        message = payload.payload;
      });
    });

    initFirebaseMessaging();

    super.initState();
  }

  void initFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification? android = message.notification?.android;

      if (android != null) {
        var a = notification.title.toString();
        var b = notification.body.toString();
        sendNotification(a, b);
      }
    });

    firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      print("Token : $token");
    });
  }

  sendNotification(String title, String body) async {
    const BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(DrawableResourceAndroidBitmap('flutter'),
            largeIcon: DrawableResourceAndroidBitmap(
              'notiicon',
            ));

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      '10000',
      'FLUTTER_NOTIFICATION_CHANNEL',
      channelDescription: 'FLUTTER_NOTIFICATION_CHANNEL_DETAIL',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
    );

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin
        .show(111, title, body, platformChannelSpecifics, payload: '');
  }

  Future<void> sendPushMessage() async {
    firebaseMessaging.getToken().then((String? _token) async {
      assert(_token != null);
      if (_token == null) {
        print('Unable to send FCM message, no token exists.');
        return;
      }

      var st = constructFCMPayload(_token);
      try {
        await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                'key=AAAA5-Pkk7Q:APA91bEEEMjIbnfxO8lFaQTCrvwPXRbJADLMHOu3nDToxKES8G6AQcnsKq34C3Kcxsh72TaLHUE2Pf1rqR0ewhpE2U_l0dZfVzpPfW5latvBc-0holS-i5D93KmaM5VQsK1ACZV_u2s5',
          },
          body: st,
        );
        print('FCM request for device sent!');
      } catch (e) {
        print(e);
      }
      print("Token : $_token");
    });
  }

 @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: 
      PreferredSize( //wrap with PreferredSize
                preferredSize: Size.fromHeight(80), //height of appbar
                child: AppBar(
                  title:Center(child: Text("Auspicious Tree")),
                  
                   //appbar title
                  backgroundColor: Color.fromARGB(255, 69, 243, 0) //appbar background color
                )
          ),
      
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formstate,
        child: ListView(
          
          children: <Widget>[
            
            // Container(
            //   width: w,
            //   height: h*0.3,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //     image:AssetImage('assets/cartoon.jpg'),
            //     // fit: BoxFit.cover,
            //     alignment: Alignment.center,
            //     )
            //   ),
            // ),
            Container(
          
              margin: EdgeInsets.only(left: 20,right: 20,top: 10),
              width: w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                // ignore: prefer_const_constructors
                  Text('Login',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Card(child: Image(image: AssetImage('assets/images/capricorn.jpg')),),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text('Email',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                      const SizedBox(height: 10,),
                      emailTextFormField(),
                      const SizedBox(height: 10,),
                      const Text('Password',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 10,),
                      passwordTextFormField(),
                      ],
                    ),
                  ),
                  button(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                    ],
                  ),
                  Container(
                     margin: EdgeInsets.only(left: 20,right: 20,top: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    
                      children: [
                        
                        const Text("Don't have account?     ",
                          style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                        registerButton( context),
                      ],
                    ),
                  ),

                const SizedBox(height: 10,),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
        child: Text('Login'),
        onPressed: () async {
          if (_formstate.currentState!.validate()) {
            print('Valid Form');
            _formstate.currentState!.save();
            try {
              await auth
                  .signInWithEmailAndPassword(
                      email: email!, password: password!)
                  .then((value) {
                if (value.user!.emailVerified) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Pass")));
                  //sendPushMessage();
                  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                  ModalRoute.withName('/homepage'));
                  sendPushMessage();

                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please verify email")));
                }
              }).catchError((reason) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login or Password Invalid")));
              });
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
              }
            }
          } else
            print('Invalid Form');
        });
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      onSaved: (value) {
        password = value!.trim();
      },
      validator: (value) {
        if (value!.length < 8)
          return 'Please Enter more than 8 Character';
        else
          return null;
      },
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      onSaved: (value) {
        email = value!.trim();
      },
      validator: (value) {
        if (!validateEmail(value!))
          return 'Please fill in E-mail field';
        else
          return null;
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'E-mail',
        icon: Icon(Icons.email),
        hintText: 'xxx@xxx.com',
      ),
    );
  }

  bool validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return (!regex.hasMatch(value)) ? false : true;
  }

  int _messageCount = 0;
  String constructFCMPayload(String token) {
    _messageCount++;
    return jsonEncode({
      'to': token,
      'data': {
        'via': 'Firebase Cloud Messaging!!! ',
        'count': _messageCount.toString(),
      },
      'notification': {
        'title': 'Hello, Welcome to my App',
        'body': 'I hope you enjoy it', //($_messageCount)
      },
    });
  }
}*/

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart'; //
import 'package:firebase_auth/firebase_auth.dart'; //
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart'; //
import 'package:google_fonts/google_fonts.dart'; //
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_1/homepage.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formstate = GlobalKey<FormState>();
  String? email;
  String? password;

  int _counter = 0;
  String? message;
  String channelId = "1000";
  String channelName = "FLUTTER_NOTIFICATION_CHANNEL";
  String channelDescription = "FLUTTER_NOTIFICATION_CHANNEL_DETAIL";
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  final auth = FirebaseAuth.instance;

  @override
  initState() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('notiicon');

    var initializationSettingsIOS = DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) async {
      print("onDidReceiveLocalNotification called.");
    });

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) async {
      // when user tap on notification.
      print("onSelectNotification called.");
      setState(() {
        message = payload.payload;
      });
    });

    initFirebaseMessaging();

    super.initState();
  }

  void initFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification? android = message.notification?.android;

      if (android != null) {
        var a = notification.title.toString();
        var b = notification.body.toString();
        sendNotification(a, b);
      }
    });

    firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      print("Token : $token");
    });
  }

  sendNotification(String title, String body) async {
    const BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(DrawableResourceAndroidBitmap('flutter'),
            largeIcon: DrawableResourceAndroidBitmap(
              'notiicon',
            ));

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      '10000',
      'FLUTTER_NOTIFICATION_CHANNEL',
      channelDescription: 'FLUTTER_NOTIFICATION_CHANNEL_DETAIL',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
    );

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin
        .show(111, title, body, platformChannelSpecifics, payload: '');
  }

  Future<void> sendPushMessage() async {
    firebaseMessaging.getToken().then((String? _token) async {
      assert(_token != null);
      if (_token == null) {
        print('Unable to send FCM message, no token exists.');
        return;
      }

      var st = constructFCMPayload(_token);
      try {
        await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                'key=AAAASPapUQA:APA91bFsZZ3wsXubotyd9vfzcMJaBLEoVNdLtws1xhtOi4CqJ3tQ_wcBtge6-xoHSJKbjUjqZEuBoAbZrb92dcqpIb5S0nFDtFv2zL65yoPjZrYTv9Ea0PCAmIAUmL6lqXe1UtaZxZip',
          },
          body: st,
        );
        print('FCM request for device sent!');
      } catch (e) {
        print(e);
      }
      print("Token : $_token");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formstate,
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: size.height,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                //Positioned(

                //top: 0,
                //left: 0,
                Image.asset(
                  'assets/images/backg.jpg',
                  width: size.width * 1,
                ),
                //),
                /*Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/edge2.png',
                    width: size.width * 0.3,
                  ),
                ),*/
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ZODIAC TREE APP',
                      style: GoogleFonts.gochiHand(
                          fontSize: 35, color: Color.fromARGB(255, 27, 66, 28)),
                    ),
                    SizedBox(height: size.height * 0.05),
                    SvgPicture.asset(
                      'assets/icons/tree-pro.svg',
                      height: size.height * 0.20,
                      //color: Color.fromARGB(255, 15, 255, 63),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    emailTextFormField(),
                    passwordTextFormField(),
                    SizedBox(height: size.height * 0.03),
                    loginButton(),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an Account?  "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  ElevatedButton registerButton(BuildContext context) {
    return ElevatedButton(
      // ignore: prefer_const_constructors
      child: Text('Register new account'),
      onPressed: () {
        print('Goto  Regis pagge');
        Navigator.pushNamed(context, '/register');
      },
    );
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
        child: Text(
          'Login',
          style: GoogleFonts.fredokaOne(
              fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        onPressed: () async {
          if (_formstate.currentState!.validate()) {
            print('Valid Form');
            _formstate.currentState!.save();
            try {
              await auth
                  .signInWithEmailAndPassword(
                      email: email!, password: password!)
                  .then((value) {
                if (value.user!.emailVerified) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Pass")));
                  //sendPushMessage();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                      ModalRoute.withName('/homepage'));
                  sendPushMessage();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please verify email")));
                }
              }).catchError((reason) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login or Password Invalid")));
              });
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
              }
            }
          } else
            print('Invalid Form');
        });
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      onSaved: (value) {
        password = value!.trim();
      },
      validator: (value) {
        if (value!.length < 8)
          return 'Please Enter more than 8 Character';
        else
          return null;
      },
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      onSaved: (value) {
        email = value!.trim();
      },
      validator: (value) {
        if (!validateEmail(value!))
          return 'Please fill in E-mail field';
        else
          return null;
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'E-mail',
        icon: Icon(Icons.email),
        hintText: 'xxx@xxx.com',
      ),
    );
  }

  bool validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return (!regex.hasMatch(value)) ? false : true;
  }

  int _messageCount = 0;
  String constructFCMPayload(String token) {
    _messageCount++;
    return jsonEncode({
      'to': token,
      'data': {
        'via': 'Firebase Cloud Messaging!!! ',
        'count': _messageCount.toString(),
      },
      'notification': {
        'title': 'WELCOME TO MY APP',
        'body': 'have a nice day', //($_messageCount)
      },
    });
  }
}
