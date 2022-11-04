import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

//ราศีเมษ
class aquariuspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี เมษ',
          style: GoogleFonts.sriracha(fontSize: 20),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Aquarius.png'),
              ),
              title: Text(
                'ราศีเมษ 21 มี.ค. – 20 เม.ย.',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
              onTap: () {},
            ),
            Card(
              child: Image(image: AssetImage('assets/images/aquarius.jpg')),
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              child: Text(
                "ราศีเมษ",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                "ชาวราศีเมษ เป็นผู้รักอิสระ ตัดสินใจอะไรฉับไว รักการผจญภัยและมักไขว่คว้าหาเรื่องแปลกใหม่ให้ชีวิตอยู่เสมอ เพราะความไม่ชอบอยู่นิ่ง จึงควรปลูกต้นไม้ที่ดูแลง่ายอย่าง “ลิ้นมังกรแคระ” ซึ่งมีความเชื่อกันว่าจะ่วยป้องกันภัยจากศัตรูได้",
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
                "ไม้ประดับพันธุ์อึดนี้ดูแลง่าย มีข้อควรระวังเดียวคืออย่าให้น้ำชุ่มจนเกินไปเพราะจะทำให้รากเน่า ให้เจอแสงแดดรำไร และอย่าปล่อยให้หน้าดินแห้ง",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
