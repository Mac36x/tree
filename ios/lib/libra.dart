import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

class librapage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี ตุลย์',
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
                    AssetImage('assets/images/lucky-plants-10-1.jpg'),
              ),
              title: Text(
                'ราศีตุลย์ LIBRA – (24 ก.ย. -23 ต.ค)',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
              onTap: () {
                print('ราศีตุลย์_โกสน');
              },
            ),
            Card(
              child: Image.asset('assets/images/lucky-plants-10.jpg'),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(3),
              child: Text(
                " ราศีตุลย์   ",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              child: Text(
                " ชาวราศีตุลย์ เป็นคนที่รักอิสระ รักความยุติธรรม มีอารมณ์ศิลป์ ชอบงานศิลปะ มีสไตล์ที่โดดเด่นใครเห็นเป็นต้องชอบ ชอบเข้าสังคม ชอบพบปะเพื่อนฝูง มีมนุษยสัมพันธ์ดี จึงเหมาะกับ “ต้นโกสน” เพราะเชื่อกันว่าเป็นต้นไม้แห่งความร่มเย็นเป็นสุข มีบุญบารมี เป็นสิริมงคล ",
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
                " เป็นไม้กลางแจ้งที่ต้องการแสงแดด หากไม่โดนแดดจะทำให้สีของใบซีดลง และควรใช้ปุ๋ยที่เหมาะสมเพื่อให้สีของใบมีความสดอยู่เสมอ ",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
