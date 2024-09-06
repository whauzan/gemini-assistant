import 'package:flutter/material.dart';
import 'package:gemini_assistant/core/configs/theme/app_colors.dart';
import 'package:gemini_assistant/presentation/onboard/pages/onboard.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    redirect(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
          child: Image.asset(
              "assets/splashscreen.png"
          )
      ),
    );
  }

  Future<void> redirect(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const OnBoardPage()
          )
      );
    }
  }
}
