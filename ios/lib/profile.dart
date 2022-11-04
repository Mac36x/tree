import 'package:flutter/material.dart';
import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/comment.dart';

class profilepage extends StatelessWidget {
  const profilepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'PROFILE',
          style: GoogleFonts.gochiHand(fontSize: 30),
        ),
      ),
      drawer: Drawer(
          child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 125, 95),
              ),
              accountName: const Text(''),
              accountEmail: Text(
                name.currentUser!.email!,
                style: GoogleFonts.gochiHand(fontSize: 15),
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: (42),
                ),
                backgroundColor: Colors.black12,
              ),
            ),
            ListTile(
                title: Text(
                  'Profile',
                  style: GoogleFonts.gochiHand(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => profilepage()));
                }),
            ListTile(
              title: Text(
                'auspicious tree',
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
          //center
          child: ListView(children: const <Widget>[
        MyRadio(),
      ])),
    );
  }
}

class MyRadio extends StatefulWidget {
  const MyRadio({Key? key}) : super(key: key);
  @override
  _MyRadioState createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  // dynamic route;
  List<String> zodices = [
    '',
    'ราศีมังกร ARIES',
    'ราศีกุมภ์ TAURUS',
    'ราศีมีน PISCES',
    'ราศีเมษ AQUARIUS ',
    'ราศีพฤษภ CAPRICORN ',
    'ราศีเมถุน GEMINI ',
    'ราศีกรกฎ CANCER ',
    'ราศีสิงห์ LEO',
    'ราศีกันย์ VIRGO ',
    'ราศีตุลย์ LIBRA ',
    'ราศีพิจิก SCORPIO ',
    'ราศีธนู SAGITTARIUS '
  ];
  dynamic zodice = '';

  List<String> trees = [
    '',
    'ต้นโป๊ยเซียนแคระ ARIES',
    'ต้นไผ่กวนอิม TAURUS',
    'ต้นบอนไซ PISCES',
    'ต้นลิ้นมังกรเเคระ AQUARIUS ',
    'ต้นกุหลาบหิน CAPRICORN ',
    'ต้นแก้วกาญจนา GEMINI ',
    'ต้นโฮ่ยาหัวใจ CANCER ',
    'ต้นทิลแลนด์เซีย LEO',
    'ต้นกระบองเพชร VIRGO ',
    'ต้นโกสน LIBRA ',
    'ต้นวาสนา SCORPIO ',
    'ต้นออมเพชร SAGITTARIUS '
  ];
  dynamic tree = '';
  final _format = DateFormat('dd/MM/yyyy');
  File? _avatar;
  dynamic sex;
  dynamic years;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Row(children: [
            TextFormField(
              initialValue: 'นักล่าปริญญา',
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Radio(
                value: 'M',
                groupValue: sex,
                onChanged: (value) {
                  setState(() {
                    sex = value;
                  });
                },
              ),
              const Text('Male'),
              const SizedBox(
                width: 40,
              ),
              Radio(
                value: 'F',
                groupValue: sex,
                onChanged: (value) {
                  setState(() {
                    sex = value;
                  });
                },
              ),
              const Text('Female'),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Radio(
                value: 'HAPPY',
                groupValue: years,
                onChanged: (value) {
                  setState(() {
                    years = value;
                  });
                },
              ),
              const Text('12-15 ปี'),
              const SizedBox(
                width: 40,
              ),
              Radio(
                value: 'WELCOME',
                groupValue: years,
                onChanged: (value) {
                  setState(() {
                    years = value;
                  });
                },
              ),
              const Text('16-20 ปี'),
              const SizedBox(
                width: 40,
              ),
              Radio(
                value: 'PLEASED',
                groupValue: years,
                onChanged: (value) {
                  setState(() {
                    years = value;
                  });
                },
              ),
              const Text('21 ปีขึ้นไป'),
            ]),

            buildSelectField(),
            SizedBox(
              height: 10,
            ),
            buildSelectFieldTree(),
            SizedBox(
              height: 10,
            ),
            buildDateField(),
            _avatar == null
                ? ElevatedButton(
                    onPressed: () {
                      onChooseImage();
                    },
                    child: const Text('Choose Avatar'),
                  )
                : Column(
                    children: [
                      Image.file(_avatar!),
                      ElevatedButton(
                        onPressed: () {
                          onChooseImage();
                        },
                        child: const Text('Change Avatar'),
                      )
                    ],
                  )
          ]),
    );
  }

  onChooseImage() async {
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

  DateTimeField buildDateField() {
    return DateTimeField(
      decoration: InputDecoration(labelText: 'Birth Date'),
      format: _format,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }

  InputDecorator buildSelectField() {
    return InputDecorator(
      decoration: const InputDecoration(labelText: 'Zodiac'),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: zodice,
          onChanged: (value) {
            setState(() {
              zodice = value;
            });
          },
          items: zodices
              .map(
                (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  InputDecorator buildSelectFieldTree() {
    return InputDecorator(
      decoration: const InputDecoration(labelText: 'Tree'),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: tree,
          onChanged: (value) {
            setState(() {
              tree = value;
            });
          },
          items: trees
              .map(
                (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
