import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class cancerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี กรกฎ',
          style: GoogleFonts.sriracha(fontSize: 20),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/lucky-plants-7-1.jpg')),
              title: Text(
                'ราศีกรกฎ วันที่ 22 มิ.ย. – 23 ก.ค',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),

              //trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('Hospital');
              },
            ),
            Card(
              child: Image.asset('assets/images/cancer.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              child: Text(
                " ราศีกรกฎ   ",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                " ชาวราศีกรกฎ เป็นคนที่เรียบง่าย ใช้ชีวิตแบบสบาย ๆ ไม่ชอบความเป็นระเบียบ มีอารมณ์อ่อนไหวง่าย รักบ้าน รักครอบครัว รักเพื่อนฝูง ชอบปกป้องคนรอบข้าง จึงเหมาะกับ “ต้นหัวใจทศกัณฐ์” เรียกอีกชื่อหนึ่งว่า ต้นโฮย่า มีความเชื่อกันว่าจะนำพาความสุขและโชคลาภให้แก่ครอบครัว เสริมการงาน และยังนิยมมอบให้กันในวันวาเลนไทน์ ",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              child: Text(
                " วิธีการดูแล  ",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                " เป็นต้นไม้ที่ชอบแสงแดด และสามารถเจริญเติบโตได้ดีในที่ที่มีอากาศถ่ายเท ให้รดน้ำวันละ 1 ครั้ง แต่อย่าให้ชุ่มหรือแฉะจนเกินไป รากอาจจะเน่าได้  ",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
