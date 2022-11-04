import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

//ราศีมีน
class piscespage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี มีน',
          style: GoogleFonts.sriracha(fontSize: 20),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Pisces.png'),
              ),
              title: Text(
                'ราศีมีน 20 ก.พ. – 20 มี.ค.',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),

              //trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            Card(
              child: Image(image: AssetImage('assets/images/pisces.jpg')),
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              child: Text(
                "ราศีมีน",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                "ชาวราศีมีน เป็นคนที่มีความคิดสร้างสรรค์ ปรับตัวได้ดี จึงเหมาะกับการปลูก “บอนไซ” ในภาพเป็นต้นเพรมน่าด่าง ซึ่งในการปลูกบอนไซมีความเชื่อกันว่าจะช่วยส่งเสริมให้มีความอดทน เอาตัวรอดได้ในทุกสถานการณ์",
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
                "ต้นเพรมน่าด่าง ชอบแสงแดดรำไรในช่วงเช้าถึงสาย รดน้ำ 1-2 ครั้งต่อวัน",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
