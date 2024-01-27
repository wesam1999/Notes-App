// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  Map Note;
  // ignore: use_key_in_widget_constructors, non_constant_identifier_names
  EditPage({required this.Note});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool hasNote = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.Note.toString() != "{}") {
      hasNote = true;
      titleController.text = widget.Note['title'];
      bodyController.text = widget.Note['body'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(
            width: 40.0,
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.all(3),
            height: 40.0,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 102, 102, 102),
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          backgroundColor: const Color.fromARGB(221, 20, 20, 20),
          //foregroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 102, 102, 102),
                borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
              ),
              child: IconButton(
                  onPressed: () {
                    if (hasNote) {
                      setState(() {
                        hasNote = false;
                      });
                    } else {
                      Map data = {
                        "title": titleController.text.toString(),
                        "body": bodyController.text.toString(),
                      };

                      Navigator.pop(context, data);
                    }
                  },
                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  )),
            )
          ]),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(221, 20, 20, 20),
        ),
        child: ListView(
          children: const [
            TextField(
              style: TextStyle(color: Colors.white, fontSize: 40),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 177, 174, 174), fontSize: 40)),
            ),
            TextField(
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type something .............",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 177, 174, 174),
                    fontSize: 16,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
