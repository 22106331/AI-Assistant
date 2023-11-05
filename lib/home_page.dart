import 'dart:io';

import 'package:flutter/material.dart';

import 'entity/explore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var list = [
    Explore(
        "Finding information",
        "i can search the internet for answers to\n"
            "your questions and provide ypu with\n"
            "relevant information on any topic",
        const Color(0xFF55EA54),
        "assets/images/ic_search.png"),
    Explore(
        "Entertainment",
        "You can ask me to play music, tell a joke"
            "\nor provide interesting facts",
        const Color(0xFFA98AFF),
        "assets/images/ic_happy.png"),
    Explore(
        "Planning assistance",
        "Ally can help you create schedules,\n"
            "organize meetings and events, and\n"
            "suggest optimal routes",
        const Color(0xFF00B6E0),
        "assets/images/ic_calendar.png"),
    Explore(null, null, Colors.black, "assets/images/ic_heart.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => {exit(0)},
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 6, left: 20, bottom: 10),
              child: Text(
                "Explore",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) =>
                        _getItem(list[index], context),
                    itemCount: list.length))
          ],
        ));
  }

  Widget _getItem(Explore explore, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 35, bottom: 15),
      child: Card(
        color: explore.bgColor,
        child: Container(
          padding: const EdgeInsets.only(left: 22, top: 21, right: 28, bottom: 13),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Image(
                      image: AssetImage(explore.iconPath),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: const Image(
                      image: AssetImage("assets/images/ic_up_arrow.png"),
                      alignment: Alignment.topRight,
                    ),
                  )
                ],
              ),
              if (explore.title != null)
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      explore.title ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black),
                    )),
              if (explore.content != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    explore.content ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
            ],
          ),
        )
      ),
    );
  }
}
