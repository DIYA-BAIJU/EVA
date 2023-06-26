import 'package:first_app/controllers/controllers.dart';
import 'package:first_app/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerPage extends StatelessWidget {
  AnswerPage({Key? key}) : super(key: key);

  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background_img.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
          children: [
            Expanded(
              flex: 11,
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("EVA",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Logo_Answer,
                              fontFamily: "Rubik Bold")),
                      Text(
                        "Educational Virtual",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 25,
                            color: Logo_Answer,
                            fontFamily: "Roboto Light"),
                      ),
                      Text(
                        "Assistant",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 25,
                            color: Logo_Answer,
                            fontFamily: "Roboto Light"),
                      ),
                      SizedBox(
                        height: 140,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                margin: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Color(0xff312052),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff301356), Color(0xff161225)],
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 10),
                        child: Text(homeController.userPrompt.value,
                            style: TextStyle(
                                fontFamily: "Roboto Light",
                                fontSize: 31,
                                color: Colors.grey)),
                      ),
                      Text(homeController.answer.value,
                          style: TextStyle(
                            fontFamily: "Roboto Light",
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
