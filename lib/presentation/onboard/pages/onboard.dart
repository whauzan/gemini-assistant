import 'package:flutter/material.dart';
import 'package:gemini_assistant/core/configs/theme/app_colors.dart';
import 'package:gemini_assistant/presentation/chat/pages/chat.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Text(
                  'Your AI Assistant',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                  ),
                ),
                SizedBox(height: 16,),
                Text(
                  'Using this software, you can ask you questions and receive articles using artificial intelligence assistant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54
                  ),
                )
              ],
            ),
            const SizedBox(height: 32,),
            Image.asset('assets/onboarding.png'),
            const SizedBox(height: 32,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const ChatPage()),
                          (route) => false
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Continue'),
                    SizedBox(height: 8,),
                    Icon(Icons.arrow_forward)
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
