import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

//ราศีกุมภ์
class tauruspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 125, 95),
        title: Text(
          'ต้นไม้มงคลประจำราศี กุมภ์',
          style: GoogleFonts.sriracha(fontSize: 20),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Taurus.png'),
              ),
              title: Text(
                'ราศีกุมภ์ 21 ม.ค. – 19 ก.พ.',
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
              onTap: () {},
            ),
            Card(
              child: Image(image: AssetImage('assets/images/taurus.jpg')),
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              child: Text(
                "ราศีกุมภ์",
                style: GoogleFonts.sriracha(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                "ชาวราศีกุมภ์ มักเป็นคนที่สุขุมนุ่มลึก ไม่ค่อยทำอะไรสะเพร่า ทั้งเด็ดเดี่ยวและไม่ท้อแท้ จึงเหมาะกับ “ไผ่กวนอิม” เพราะมีความเชื่อว่าจะช่วยดึงดูดความสงบและความเฉลียวฉลาดในตัวผู้ปลูก และยังเป็นไม้มงคลเสริมฮวงจุ้ย หมายถึงพระโพธิสัตว์กวนอิม นิยมปลูกประดับในอาคาร",
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
                "เป็นไม้ที่ดูแลง่าย ต้องการแสงแดดรำไร เติมน้ำหล่อไว้ อย่าให้แห้ง",
                style: GoogleFonts.sriracha(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
