import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
class leopage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text('ต้นไม้มงคลประจำราศี สิงห์',style:GoogleFonts.sriracha(fontSize: 20),),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/lucky-plants-8-1.jpg'),
              ),
              title:  Text('ราศีสิงห์ LEO – 24 ก.ค. -23 ส.ค',style:GoogleFonts.sriracha(fontSize: 18),),
              onTap: () {
                print('Hospital');
              },
            ),
            Card(
              child: Image.asset('assets/images/lucky-plants-8.jpg'),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(3),
              child:  Text(
                " ราศีสิงห์   ",
                style:GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              child:  Text(
                " ชาวราศีสิงห์ เป็นคนที่มีบุคลิกกล้าหาญ กล้าได้กล้าเสีย รักเพื่อนรักฝูง มุมานะพากเพียร จะทำอะไรก็ต้องประสบความสำเร็จ จึงเหมาะกับ “ต้นทิลแลนด์เซีย” หรือเรียกอีกชื่อหนึ่งว่า สับปะรดอากาศ เป็นพืชที่อยู่วงศ์สับปะรด มีความเชื่อกันว่าต้นทิลแลนด์เซียจะช่วยทำให้ชีวิตประสบความสำเร็จ ราบรื่น ไม่มีอุปสรรคมาขัดขวาง ",
                style:GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(3),
              child:  Text(
                " วิธีการดูแล  ",
                style:GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              child:  Text(
                " เป็นต้นไม้ที่ทนความแห้งแล้งและต้องการแสงแดดมาก แต่ต้องไม่ร้อนจัดจนเกินไป และไม่ค่อยต้องการน้ำมากนัก ให้รดน้ำโดยใช้วิธีการฉีดพ่น ",
                style:GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}