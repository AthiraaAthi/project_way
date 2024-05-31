import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/login_screen/login_screen.dart';
import 'package:project_way/view/screen/responsive.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/splash_video.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
        _controller.play();
      });

    _controller.setLooping(false);
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        // Video finished playing
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.bgIndigo,
          body: ResponsiveWidget(
            mobile: Center(
              //Mobile
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "WAY",
                    style: TextStyle(fontSize: 55, fontWeight: FontWeight.w800),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 170),
                    child: Text(
                      "A way to your all solutions",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            tab: Center(
              //Tab
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "WAY",
                    style: TextStyle(fontSize: 75, fontWeight: FontWeight.w800),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 170),
                    child: Text(
                      "A way to your all solutions",
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
