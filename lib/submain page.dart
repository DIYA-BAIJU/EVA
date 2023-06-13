import 'package:first_app/components/microphone.dart';
import 'package:flutter/material.dart';

class SubmainPage extends StatelessWidget {
  const SubmainPage({super.key});

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
            child: Row(
              children: [
                const SizedBox(
                  width: 180,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("VIVA",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40)),
                      const Text(
                        "Voice Integrated Virtual",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 35),
                      ),
                      const Text(
                        "Assistant",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 35),
                      ),
                      ElevatedButton(
                        child: const Text('back'),
                        onPressed: () {
                          Navigator.pop(
                              context); // Navigate to second route when tapped.
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 470,
                ),
                const ShapeScreen(),
                // IconButton(
                //     iconSize: 200,
                //     onPressed: () {},
                //     icon: Image.asset(
                //       "assets/mic_icon.png",
                //       fit: BoxFit.fill,
                //     ))
              ],
            ),
          ),
        ));
  }
}
