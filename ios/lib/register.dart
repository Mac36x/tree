/*import 'package:flutter_application_1/login.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {

const RegisterPage({Key? key}) : super(key: key);

@override

_RegisterPageState createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {

final _formstate = GlobalKey<FormState>();

TextEditingController email = TextEditingController();

TextEditingController password = TextEditingController();

final auth = FirebaseAuth.instance;

@override

Widget build(BuildContext context) {

return Scaffold(

body: Form(

key: _formstate,

child: ListView(

children: <Widget>[

buildEmailField(),

buildPasswordField(),

buildRegisterButton(),

],

),

));

}

ElevatedButton buildRegisterButton() {

return ElevatedButton(

child: const Text('Register'),

onPressed: () async{
  print('Regis new Account');
  if(_formstate.currentState!.validate())print(email.text);
  print(password.text);
  final _user = await auth.createUserWithEmailAndPassword(
    email:email.text.trim(),password: password.text.trim());
   _user.user!.sendEmailVerification();
   Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
    ModalRoute.withName('/')
   );

},

);

}

TextFormField buildPasswordField() {

return TextFormField(

controller: password,
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

TextFormField buildEmailField() {

return TextFormField(

controller: email,

validator: (value) {

if (value!.isEmpty)

return 'Please fill in E-mail field';

else

return null;

},

keyboardType: TextInputType.emailAddress,

textInputAction: TextInputAction.next,

decoration: const InputDecoration(

labelText: 'E-mail',

icon: Icon(Icons.email),

hintText: 'x@x.com',

),

);

}

}*/




import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formstate = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final auth = FirebaseAuth.instance;
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
                /*Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/top.png',
                    width: size.width * 0.3,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/button.png',
                    width: size.width * 0.3,
                  ),
                ),*/
                Image.asset(
                    'assets/images/backg.jpg',
                    width: size.width * 1,
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'REGISTER',
                      style: GoogleFonts.gochiHand(
                          fontSize: 50, color: Color.fromARGB(255, 0, 213, 43)),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      'assets/icons/user.svg',
                      color: Color.fromARGB(255, 99, 239, 104),
                      height: size.height * 0.30,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    buildEmailField(),
                    buildPasswordField(),
                    SizedBox(height: size.height * 0.03),
                    buildRegisterButton(),
                    SizedBox(height: size.height * 0.03),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Back to  "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'LogIn',
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  ElevatedButton buildRegisterButton() {
    return ElevatedButton(
      child: Text('Register',style: GoogleFonts.fredokaOne(color: Colors.white),),
      onPressed: () async {
        print('Regis new Account');
        if (_formstate.currentState!.validate()) print(email.text);
        print(password.text);
        final _user = await auth.createUserWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim());
        _user.user!.sendEmailVerification();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            ModalRoute.withName('/'));
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: password,
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

  TextFormField buildEmailField() {
    return TextFormField(
      controller: email,
      validator: (value) {
        if (value!.isEmpty)
          return 'Please fill in E-mail field';
        else
          return null;
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'E-mail',
        icon: Icon(Icons.email),
        hintText: 'x@x.com',
      ),
    );
  }
}


