import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

class sagittariuspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี ธนู',
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
                    AssetImage('assets/images/lucky-plants-12-1.jpg'),
              ),
              title: Text(
                'ราศีธนู วันที่ 23 พ.ย.- 22 ธ.ค',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
              onTap: () {
                print('ราศีธนู_ออมเพชร');
              },
            ),
            Card(
              child: Image.asset('assets/images/lucky-plants-12.jpg'),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(3),
              child: Text(
                " ราศีธนู   ",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              child: Text(
                " ชาวราศีธนู เป็นคนที่มีความเป็นผู้นำ ชอบเป็นที่ปรึกษาให้กับคนอื่น เพราะเป็นคนที่จิตใจดี เป็นมิตร ชอบให้ความช่วยเหลือ นอกจากนั้นยังเป็นคนใจบุญสุนทาน หาเงินเก่ง มีเงินหมุนเข้าออกตลอดเวลา จึงเหมาะกับ “ต้นออมเพชร” พืชที่อยู่ในวงศ์เดียวกับต้นบอน และมีความเชื่อกันว่าจะเป็นสิริมงคล มีเงินเหลือกินเหลือใช้ เสริมโชคด้านการเงิน ",
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
                " เจริญเติบโดได้ดีในดินแทบทุกชนิด ที่ปลูกควรมีอากาศถ่ายเท ต้องการแสงแดดรำไร ต้องรดน้ำวันละ 1 ครั้ง ",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
