import 'package:first_app/components/microphone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomeController homeController = Get.put(HomeController());

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
                                  fontFamily: "Rubik Bold")),
                          Text(
                            "Educational Virtual",
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
                      child: Column(
                        children: [
                          Container(
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            alignment: Alignment.centerLeft,
                            child: ShapeScreen(
                              homeController: homeController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 50),
                            child: Obx(() => homeController.isQueryReady.value
                                ? Image.asset("assets/loading.gif")
                                : Text(homeController.isRecording.value
                                    ? "Speak Now"
                                    : "")),
                          ),
                        ],
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
