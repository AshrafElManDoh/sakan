import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/widgets/custom_logo.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff255685),
      body: Center(
        child: IntroductionScreen(
          globalBackgroundColor: Color(0xff255685),
          showNextButton: true,
          showDoneButton: true,
          showSkipButton: true,
          next: Text(
            "Next",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          pages: [
            pageViewModel(text: ""),
            pageViewModel(
              text:
                  "100% Egyptian application to offer and rent apartments to students",
            ),
            pageViewModel(
              text:
                  "We will help you find an apartment close to your college at a reasonable price",
            ),
          ],
          skip: const Text(
            "Skip Intro",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          done: const Text(
            "start",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onDone: () {
            GoRouter.of(context).go(AppRouter.studentOrOwner);
          },
          dotsDecorator: DotsDecorator(
            size: Size(10, 5),
            activeSize: const Size(30, 5),
            color: Colors.black,
            activeColor: kPrimaryColor,
            spacing: const EdgeInsets.symmetric(horizontal: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }

  PageViewModel pageViewModel({required String text}) {
    return PageViewModel(
      image: CustomLogo(
        radius: 95,
      ),
      bodyWidget: Text(
        text,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      titleWidget: Text(
        "Sakan",
        style: TextStyle(
          fontSize: 92,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
