import 'package:flutter/material.dart';

import 'entity/message.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  var list = [
    Message("chat pot platform customer service", null, null, true),
    Message(
        "Imagine a smiling man baker passes a basket of buns to a woman customer, in the background a rack with cakes",
        null,
        "12:30",
        false),
    Message(null, "assets/images/demo.png", null, true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {},
        ),
        title: const Text(
          "Ally",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 22, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: SizedBox(
                width: 41,
                height: 41,
                child: Image.asset("assets/images/ic_ai.png")),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 19, right: 25, top: 10),
        child: ListView.builder(
            itemBuilder: (context, index) => _getItem(list[index]),
            itemCount: list.length),
      ),
    );
  }

  Widget _getItem(Message msg) {
    if (msg.isAI) {
      return Container(
        margin: const EdgeInsets.only(right: 20, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 41,
              height: 41,
              child: Image.asset("assets/images/ic_ai.png"),
            ),
            Expanded(child: _getAnswer(msg))
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(right: 20, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(
                  left: 14, top: 12, bottom: 12, right: 20),
              margin: const EdgeInsets.only(right: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    msg.content ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    msg.time ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )

            )),
            SizedBox(
              width: 41,
              height: 41,
              child: Image.asset("assets/images/ic_user.png"),
            ),
          ],
        ),
      );
    }
  }

  Widget _getAnswer(Message msg) {
    if (msg.content != null) {
      return Container(
        padding:
            const EdgeInsets.only(left: 14, top: 12, bottom: 12, right: 20),
        margin: const EdgeInsets.only(left: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        child: Text(
          msg.content ?? "",
          style: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w200),
        ),
      );
    }
    if (msg.img != null) {
      return Container(
        margin: const EdgeInsets.only(left: 7),
        child: Image.asset("assets/images/demo.png"),
      );
    }
    return Container();
  }
}
