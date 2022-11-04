import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

class scorpiopage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี พิจิก',
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
                    AssetImage('assets/images/lucky-plants-11-1.jpg'),
              ),
              title: Text(
                'ราศีพิจิก Scorpio – (24 ต.ค.- 22 พ.ย)',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
              onTap: () {
                print('ราศีพิจิก_วาสนา');
              },
            ),
            Card(
              child: Image.asset('assets/images/lucky-plants-11.jpg'),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(3),
              child: Text(
                " ราศีพิจิก   ",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              child: Text(
                " ชาวราศีพิจิก เป็นคนที่มีความเป็นของตัวเองสูง มีความมั่นใจในตัวเอง มีปฏิภาณไหวพริบ มีความรู้ความสามารถรอบตัวสูง ละเอียดรอบคอบ มีความกระตือรือร้น จึงเหมาะกับ “ต้นวาสนา” หรือมีชื่อเรียกอีกชื่อหนึ่งว่า สายสะพายจอมพล มีความเชื่อกันว่าจะทำให้เกิดความสุข ได้สมหวังตามที่ปรารถนา อธิษฐานขออะไรก็จะได้ตามที่ต้องการ ช่วยเสริมเรื่องโชคลาภและความเจริญรุ่งเรือง ",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(3),
              child: Text(
                " วิธีการดูแล  ",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              child: Text(
                " เป็นต้นไม้ที่ชอบอากาศเย็น ต้องการน้ำปริมาณปานกลางไปจนถึงมาก และต้องใช้ดินที่มีความชื้นสูง ",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
