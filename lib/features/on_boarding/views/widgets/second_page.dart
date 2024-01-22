import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/common/widgets/fading_text.dart';
import 'package:todo_app/core/common/widgets/round_button.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/core/res/colours.dart';
import 'package:todo_app/core/res/image_res.dart';
import 'package:todo_app/features/authentication/views/sign_in_screen.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children : [
          const FadingText(
            'Project made by @Kelompok2',
            textAlign: TextAlign.center,
              fontSize: 12,
              fontWeight: FontWeight.normal,
              colour: Colours.darkGrey,
          ),
          Image.asset(ImageRes.female),
          const WhiteSpace(height: 5),
          const FadingText(
            'Secure',
            textAlign: TextAlign.center,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          const FadingText(
            'Task Management',
            textAlign: TextAlign.center,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          const WhiteSpace(height: 30),
          RoundButton(
            text: 'Klik untuk Login',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const SignInScreen(),
                ),
              );
            },
          ),
          const WhiteSpace(height: 25),
        ],
      ),
    );
  }
}
