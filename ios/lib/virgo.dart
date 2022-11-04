import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

class virgopage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี กันย์',
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
                    AssetImage('assets/images/lucky-plants-9-1.jpg'),
              ),
              title: Text(
                'ราศีกันย์ VIRGO – (24 ส.ค. -23 ก.ย)',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
              onTap: () {
                print('ราศีกันย์_กระบองเพชร');
              },
            ),
            Card(
              child: Image.asset('assets/images/lucky-plants-9.jpg'),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(3),
              child: Text(
                " ราศีกันย์   ",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              child: Text(
                " ชาวราศีกันย์ เป็นคนที่เก่งด้านการจัดการ ชอบเก็บหอมรอมริบ มีความตั้งใจสูง ชอบหาความรู้ ชอบเป็นที่พึ่ง รับฟังคนอื่นอยู่เสมอ จึงเหมาะสม “ต้นกระบองเพชร” พืชที่มีแหล่งกำเนิดในทะเลทราย มีความเชื่อกันว่าเป็นต้นไม้ที่นำโชคทางด้านการงานและการเงิน หากบ้านไหนเลี้ยงต้นกระบองเพชรได้สวยงาม ออกดอก บ้านนั้นจะมีโชคลาภ ",
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
                " เป็นต้นไม้ที่ชอบแสงแดด ควรวางให้โดนแสงแดดประมาณ 4-6 ชั่วโมงต่อวัน นอกจากนี้ต้องเลือกดินละปุ๋ยที่เหมาะสม ต้องระบายน้ำได้ดี หากดินแฉะจนเกินไปจะให้ต้นไม้ตายได้ ",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
