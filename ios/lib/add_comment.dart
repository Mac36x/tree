// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/dp_helper.dart';

class AddCommentPage extends StatefulWidget {
  const AddCommentPage({Key? key}) : super(key: key);

  @override
  _AddCommentPageState createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  final _form = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _name = TextEditingController();
  final _tree = TextEditingController();
  final _comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Comment'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            //    buildIdField(),
            buildNameField(),
            buildTreeField(),
            buildCommentField(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  ElevatedButton buildSaveButton() {
    return ElevatedButton(
        child: const Text('Save'),
        onPressed: () async {
          if (_form.currentState!.validate()) {
            print('save button press');

            Map<String, dynamic> row = {
              DatabaseHelper.columnName: _name.text,
              DatabaseHelper.columnTree: _tree.text,
              DatabaseHelper.columnComment: _comment.text,
            };
            final dbHelper = DatabaseHelper.instance;
            final id = await dbHelper.insert(row);

            print('inserted row id: $id');

            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(_form.currentContext!).showSnackBar(
              const SnackBar(
                content: Text('Please validate value'),
              ),
            );
          }
        });
  }

  TextFormField buildIdField() {
    return TextFormField(
      controller: _id,
      decoration: const InputDecoration(
        labelText: 'id',
        icon: Icon(Icons.book),
      ),
      validator: (value) => value!.isEmpty ? 'Please fill in id' : null,
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(
        labelText: 'name',
        icon: Icon(Icons.people),
      ),
      validator: (value) => value!.isEmpty ? 'Please fill in name' : null,
    );
  }

  TextFormField buildTreeField() {
    return TextFormField(
      controller: _tree,
      decoration: const InputDecoration(
        labelText: 'tree',
        icon: Icon(Icons.filter_vintage),
      ),
      validator: (value) => value!.isEmpty ? 'Please fill in tree' : null,
    );
  }

  TextFormField buildCommentField() {
    return TextFormField(
      controller: _comment,
      decoration: const InputDecoration(
        labelText: 'comment',
        icon: Icon(Icons.comment),
      ),
      validator: (value) => value!.isEmpty ? 'Please fill in comment' : null,
    );
  }
}