import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

//ราศีเมถุน
class geminipage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี เมถุน',
          style: GoogleFonts.sriracha(fontSize: 20),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/Gemini.png'),
              ),
              title: Text(
                'ราศีเมษ 21 พ.ค. – 21 มิ.ย.',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
              onTap: () {},
            ),
            Card(
              child: Image(image: AssetImage('assets/images/gemini.jpg')),
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              child: Text(
                "ราศีเมถุน",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                "เป็นคนลักษณะสดใสร่าเริงและมีอารมณ์ขันเสมอ ชอบมีความคิดริเริ่ม มีความสามารถในการวางแผนต่าง ๆ แต่มักจะเป็นคนที่เบื่อง่าย ควรเพื่อเพิ่มความมีชีวิตชีวาให้กับตัวเองด้วย “แก้วกาญจนา” ราชาแห่งไม้ประดับ ไม้มงคลสีสันสดใสที่ช่วยส่งเสริมสร้างโชคลาภให้แก่ผู้ปลูก แถมยังเป็นพืชช่วยฟอกอากาศอีกด้วย",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
            Container(
              child: const Text(""),
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              child: Text(
                "วิธีการดูแล",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                "เป็นไม้ที่ไม่ชอบแดดจัดจนเกินไป เพราะจะทำให้ใบไหม้ได้ ควรตั้งไว้ในที่ร่มแดดรำไร รดน้ำเพียงวันละครั้งพอชื้น ๆ ก็พอ",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
