import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

//ราศีมังกร
class ariespage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี มังกร',
          style: GoogleFonts.sriracha(fontSize: 20),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Aries.png'),
              ),
              title: Text(
                'ราศีมังกร วันที่ 22 ธ.ค. – 20 ม.ค',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
              onTap: () {},
            ),
            Card(
              child: Image(image: AssetImage('assets/images/aries.jpg')),
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              child: Text(
                "ราศีมังกร",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                "   ชาวราศีมังกร เป็นคนค่อนข้างเป็นคนรอบคอบ ละเอียดอ่อน และมีความเข้มแข็งแกร่งกล้าแม้จะเป็นคนอ่อนไหวง่าย จึงเหมาะกับ “โป๊ยเซียนแคระ” ที่ลำต้นมีหนามอยู่รอบ แต่ต้องการคนละเมียดละไมมาดูแล ซึ่งโป๊ยเซียนถือเป็นไม้มงคลและเป็นไม้เสี่ยงทายในสมัยจีนโบราณ มีผู้ปลูกเป็นฮ่องเต้หรือพระราชวงศ์เท่านั้น ปัจจุบันหากปลูกครบ 8 ดอก จะหมายถึงเทพเจ้าหรือผู้วิเศษ 8 องค์ ทำให้มีโชคลาภและคุ้มครองให้เป็นสุขอีกด้วย",
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
                "   ให้เจอแดดอย่างน้อย 3-4 ชั่วโมงหรือครึ่งวัน ไม่ชอบดินแฉะ ควรปลูกในดินผสมพิเศษหรือดินร่วนซุยที่ระบายน้ำได้ดี",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
