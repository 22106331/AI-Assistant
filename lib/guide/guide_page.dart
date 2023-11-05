import 'package:demo/main_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  var _index = 0;

  Widget _getGuideView() {
    return Container(
      margin: const EdgeInsets.only(top: 94),
      child: Column(
        children: [
          Image.asset("assets/images/guide_1.png"),
          const Text(
            "Hello, it’s Al Ally!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              "Welcome to our Ai assistant app!\n"
              "we’re excited to have you on\n"
              "board. Here are a few steps to\n"
              "help you get started",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0x80000000),
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 42),
            child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const MainPage();
                    },
                  ));
                },
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                textColor: Colors.white,
                child: const Text("Skip")),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            onPageChanged: (index) {
              setState(() {
                _index = index;
              });
            },
            controller: PageController(
                initialPage: 0, keepPage: false, viewportFraction: 1),
            pageSnapping: true,
            physics: const ClampingScrollPhysics(),
            children: [
              _getGuideView(),
              _getGuideView(),
              _getGuideView()
            ],
          ),
          Positioned(
              top: 44,
              child: DotsIndicator(
                  mainAxisAlignment: MainAxisAlignment.center,
                  reversed: false,
                  dotsCount: 3,
                  position: _index,
                  decorator: DotsDecorator(
                    color: const Color(0x40000000),
                    activeColor: const Color(0xFF1E1E1E),
                    size: const Size.square(10.0),
                    activeSize: const Size(28.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  )))
        ],
      ),
    );
  }
}
