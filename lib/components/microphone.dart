import 'package:first_app/controllers/controllers.dart';
import 'package:flutter/material.dart';
import '../pages/answer_page.dart';
import './rec.dart';

class ShapeScreen extends StatefulWidget {
  const ShapeScreen({Key? key, required this.homeController}) : super(key: key);
  final HomeController homeController;

  @override
  State<ShapeScreen> createState() => _ShapeScreenState();
}

class _ShapeScreenState extends State<ShapeScreen>
    with TickerProviderStateMixin {
  /// when playing, animation will be played
  bool playing = false;
  late final Rec rec;

  /// animation controller for the play pause button
  late AnimationController _playPauseAnimationController;

  /// animation & animation controller for the top-left and bottom-right bubbles
  late Animation<double> _topBottomAnimation;
  late AnimationController _topBottomAnimationController;

  /// animation & animation controller for the top-right and bottom-left bubbles
  late Animation<double> _leftRightAnimation;
  late AnimationController _leftRightAnimationController;

  @override
  void initState() {
    super.initState();
    rec = Rec(homeController: widget.homeController);
    rec.initRecorder();
    _playPauseAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _topBottomAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _leftRightAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _topBottomAnimation = CurvedAnimation(
            parent: _topBottomAnimationController, curve: Curves.decelerate)
        .drive(Tween<double>(begin: 5, end: -5));
    _leftRightAnimation = CurvedAnimation(
            parent: _leftRightAnimationController, curve: Curves.easeInOut)
        .drive(Tween<double>(begin: 5, end: -5));

    _leftRightAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _leftRightAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _leftRightAnimationController.forward();
      }
    });

    _topBottomAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _topBottomAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _topBottomAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _playPauseAnimationController.dispose();
    _topBottomAnimationController.dispose();
    _leftRightAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = 200;
    double height = 200;

    return Padding(
      padding: const EdgeInsets.only(top: 150, left: 50),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // bottom right dark pink
            AnimatedBuilder(
              animation: _topBottomAnimation,
              builder: (context, _) {
                return Positioned(
                  bottom: _topBottomAnimation.value,
                  right: _topBottomAnimation.value,
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.9,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [pink, blue],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: pink.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // top left pink
            AnimatedBuilder(
                animation: _topBottomAnimation,
                builder: (context, _) {
                  return Positioned(
                    top: _topBottomAnimation.value,
                    left: _topBottomAnimation.value,
                    child: Container(
                      width: width * 0.9,
                      height: height * 0.9,
                      decoration: BoxDecoration(
                        color: pink.withOpacity(0.5),
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [pink, blue],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: playing
                            ? [
                                BoxShadow(
                                  color: pink.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                ),
                              ]
                            : [],
                      ),
                    ),
                  );
                }), // light pink
            // bottom left blue
            AnimatedBuilder(
                animation: _leftRightAnimation,
                builder: (context, _) {
                  return Positioned(
                    bottom: _leftRightAnimation.value,
                    left: _leftRightAnimation.value,
                    child: Container(
                      width: width * 0.9,
                      height: height * 0.9,
                      decoration: BoxDecoration(
                        color: blue,
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [pink, blue],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: blue.withOpacity(0.5),
                            blurRadius: 15,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            // top right dark blue
            AnimatedBuilder(
              animation: _leftRightAnimation,
              builder: (context, _) {
                return Positioned(
                  top: _leftRightAnimation.value,
                  right: _leftRightAnimation.value,
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.9,
                    decoration: BoxDecoration(
                      color: blue,
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [pink, blue],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: playing
                          ? [
                              BoxShadow(
                                color: blue.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ]
                          : [],
                    ),
                  ),
                );
              },
            ),
            // play button
            GestureDetector(
              onTap: () {
                playing = !playing;
                widget.homeController.updateRecordingStatus(playing);
                startReording();
                if (playing) {
                  _playPauseAnimationController.forward();
                  _topBottomAnimationController.forward();
                  Future.delayed(const Duration(milliseconds: 500), () {
                    _leftRightAnimationController.forward();
                  });
                } else {
                  _playPauseAnimationController.reverse();
                  // _topBottomAnimationController.reverse();
                  // _leftRightAnimationController.reverse();
                  _topBottomAnimationController.reset();
                  _leftRightAnimationController.reset();
                  _topBottomAnimationController.stop();
                  _leftRightAnimationController.stop();
                }
              },
              child: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/mic_icon.png")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startReording() {
    print("here");
    rec.recordMic();
    if (widget.homeController.isQueryReady.value == true) {}
    if (widget.homeController.isAnswerReady.value == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AnswerPage()));
    }
  }
}

const white = Colors.white;
const purple = Color(0xff1D0E2F);
const blue = Color(0xff4B5DFC);
const pink = Color(0xffD523A3);
