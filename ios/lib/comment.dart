import 'package:flutter/material.dart';
import 'package:flutter_application_1/up_comment.dart';
import 'package:flutter_application_1/dp_helper.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<Map<String, dynamic>> us = [];

  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 144, 238, 141),
        title: Text(
          "COMMENT ",
          style: GoogleFonts.gochiHand(fontSize: 30),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                //            dbHelper.onDrop();
                await Navigator.pushNamed(context, '/add_comment');
                _query();
              })
        ],
      ),
      drawer: Drawer(
          child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 125, 95),
              ),
              accountName: const Text(''),
              accountEmail: Text(
                name.currentUser!.email!,
                style: GoogleFonts.gochiHand(fontSize: 15),
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: (42),
                ),
                backgroundColor: Colors.black12,
              ),
            ),
            ListTile(
                title: Text(
                  'Profile',
                  style: GoogleFonts.gochiHand(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => profilepage()));
                }),
            ListTile(
              title: Text(
                'auspicious tree',
                style: GoogleFonts.gochiHand(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
            ),
            ListTile(
              title: Text(
                'comment',
                style: GoogleFonts.gochiHand(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CommentPage()));
              },
            ),
          ],
        ),
      )),
      body: _myListView(context),
    );
  }

  Future<void> _query() async {
    final allRows = await dbHelper.queryAllRows();
    setState(() {
      us = allRows;
    });
  }

  void _delete(Map<String, dynamic> us) async {
    var _id = us['_id'];
    // Assuming that the number of rows is the id for the last row.
    //final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(_id);
    print('deleted $rowsDeleted row(s): row $_id');
    _query();
  }

  Widget _myListView(BuildContext context) {
    // _query();
    return ListView.builder(
      itemCount: us.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(' ' + us[index]['name'] + ' => ' + us[index]['tree']),
          subtitle: Text('' + us[index]['comment']),
          trailing: IconButton(
              icon: const Icon(Icons.delete_rounded),
              onPressed: () {
                _delete(us[index]);
              }),
          onTap: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpDateCommentPage(
                    us: us[index],
                  ),
                ));
            _query();
          },
        );
      },
    );
  }
}
