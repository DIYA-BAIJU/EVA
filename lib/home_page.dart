import 'package:first_app/components/microphone.dart';
import 'package:flutter/material.dart';
import 'submain_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_img.png"), fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Stack(children: [
              Container(
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 150, left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("EVA",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  fontFamily: "Rubik Medium")),
                          Text(
                            "Voice Integrated Virtual",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 35, fontFamily: "Roboto Light"),
                          ),
                          Text(
                            "Assistant",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 35, fontFamily: "Roboto Light"),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   width: 250,
                    // ),
                    Expanded(
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        alignment: Alignment.centerLeft,
                        child: ShapeScreen(),
                      ),
                    ),
                    // IconButton(
                    //     iconSize: 200,
                    //     onPressed: () {},
                    //     icon: Image.asset(
                    //       "assets/mic_icon.png",
                    //       fit: BoxFit.fill,
                    //
                    //   ))
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
