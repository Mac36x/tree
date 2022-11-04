import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

//ราศีพฤษก
class capricornpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี พฤษก',
          style: GoogleFonts.sriracha(fontSize: 20),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Capricorn.png'),
              ),
              title: Text(
                'ราศีพฤษก 21 เม.ย. – 20 พ.ค.',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
              onTap: () {},
            ),
            Card(
              child: Image(image: AssetImage('assets/images/capricorn.jpg')),
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              child: Text(
                "ราศีพฤษก",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                "ชาวราศีพฤษภ เป็นผู้รักสวยรักงาม จัดการชีวิตอย่างมีระเบียบ ไม่ใจร้อน เหมาะกับ “กุหลาบหิน” ซึ่งในภาพเป็นพันธุ์ Echeveria peacockii Croucher กุหลาบหินมีลักษณะเหมือนกุหลาบที่มีความแข็งแรงเหมือนหิน มีความโดดเด่นด้านความสวยความงามทุกสายพันธุ์ สามารถดูดสารพิษในอากาศได้ และยังมีความเชื่อตามโหราศาสตร์อีกว่าหากปลูกต้นไม้นี้จะร่ำรวยเป็นเศรษฐี",
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
                "ชอบอากาศเย็นที่มีแสงรำไร อย่างในช่วงครึ่งวันเช้า รดน้ำ 2 อาทิตย์ครั้ง หรือ 10 วันครั้ง เพื่อชะลอไม่ให้ดินชื้นจนเกิดไป เพราะจะทำให้ต้นเน่าได้",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
