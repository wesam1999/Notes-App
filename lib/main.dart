import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(221, 20, 20, 20),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List notes = [];
  List colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.amber,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(221, 20, 20, 20),
          title: const Text(
            "Notes",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          actions: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 102, 102, 102),
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  )
                ],
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            notes.isEmpty
                ? Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm5MIp2UtX0ND2efBZ0ZinhbREifqH_QS5og&usqp=CAU",
                        ),
                        const Text(
                          "Create Your First Note",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: notes.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return note(notes[index], index);
                    }),
          ],
        ),
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(221, 20, 20, 20),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => EditPage(
                      Note: {},
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }

  Widget note(note, index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => EditPage(
              Note: note,
            ),
          ),
        ).then((value) {
          if (value.toString() != "null") {
            setState(() {
              notes.removeAt(index);
              notes.insert(index, value);
            });
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: colors[Random().nextInt(6)],
            borderRadius: BorderRadius.circular(4)),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        child: Text(
          note['title'].toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
