// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/dp_helper.dart';

class UpDateCommentPage extends StatefulWidget {
  final Map<String, dynamic>? us;
  const UpDateCommentPage({Key? key, @required this.us}) : super(key: key);
  @override
  _UpDateCommentPageState createState() => _UpDateCommentPageState();
  // receive data from the FirstScreen as a parameter

}

class _UpDateCommentPageState extends State<UpDateCommentPage> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _id = TextEditingController(text: widget.us!['_id'].toString());
    final _name = TextEditingController(text: widget.us!['name'].toString());
    final _tree = TextEditingController(text: widget.us!['tree'].toString());
    final _comment =TextEditingController(text: widget.us!['comment'].toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Comment'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _name,
              //   initialValue: widget.us['name'],
              decoration: const InputDecoration(
                labelText: 'name',
                icon: Icon(Icons.people),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please fill in name' : null,
            ),
            TextFormField(
              controller: _tree,
              //   initialValue: widget.us['name'],
              decoration: const InputDecoration(
                labelText: 'tree',
                icon: Icon(Icons.filter_vintage),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please fill in tree' : null,
            ),
            TextFormField(
              controller: _comment,
              //   initialValue: widget.us['name'],
              decoration: const InputDecoration(
                labelText: 'comment',
                icon: Icon(Icons.comment),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please fill in comment' : null,
            ),
            ElevatedButton(
                child: const Text('Save'),
                onPressed: () async {
                  if (_form.currentState!.validate()) {
                    print('save button press');

                    Map<String, dynamic> row = {
                      DatabaseHelper.columnId: int.parse(_id.text),
                      DatabaseHelper.columnName: _name.text,
                      DatabaseHelper.columnTree: _tree.text,
                      DatabaseHelper.columnComment: _comment.text,
                    };
                    final dbHelper = DatabaseHelper.instance;
                    final rowsAffected = await dbHelper.update(row);
                    print('updated $rowsAffected row(s)');
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(_form.currentContext!).showSnackBar(
                      const SnackBar(
                        content: Text('Please validate value'),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}