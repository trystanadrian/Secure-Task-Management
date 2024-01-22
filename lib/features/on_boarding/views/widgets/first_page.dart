import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/common/widgets/fading_text.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/core/res/colours.dart';
import 'package:todo_app/core/res/image_res.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageRes.todo),
          const WhiteSpace(height: 30),
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
          const WhiteSpace(height: 10),
          Text(
            'Secure Task Management untuk mengoptimalisasi produktivitas Anda dengan tetap memprioritaskan aspek keamanan.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: Colours.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
