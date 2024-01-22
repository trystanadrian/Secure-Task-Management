import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/core/res/colours.dart';
import 'package:todo_app/core/res/image_res.dart';
import 'package:todo_app/core/utils/core_utils.dart';
import 'package:todo_app/features/authentication/controller/authentication_controller.dart';

class OTPVerificationScreen extends ConsumerWidget {
  const OTPVerificationScreen({required this.verificationId, super.key});

  final String verificationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageRes.todo),
              const WhiteSpace(height: 26),
              Pinput(
                length: 6,
                onCompleted: (pin) async {
                  CoreUtils.showLoader(context);
                  await ref.read(authControllerProvider).verifyOTP(
                        context: context,
                        verificationId: verificationId,
                        otp: pin,
                      );
                },
                defaultPinTheme: PinTheme(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colours.darkGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
