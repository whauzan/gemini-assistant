import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_assistant/core/configs/theme/app_colors.dart';
import 'package:gemini_assistant/domain/entities/chat/chat.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatEntity> _chats = [];
  bool _isLoading = false;

  callGeminiModel() async{
    try{
      if(_controller.text.isNotEmpty){
        _chats.add(ChatEntity(text: _controller.text, isUser: true));
        _isLoading = true;
      }

      final model = GenerativeModel(model: 'gemini-pro', apiKey: dotenv.env['GOOGLE_API_KEY']!);
      final prompt = _controller.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      setState(() {
        _chats.add(ChatEntity(text: response.text!, isUser: false));
        _isLoading = false;
      });

      _controller.clear();
    }
    catch(e){
      if (kDebugMode) {
        print("Error : $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/gemini-robot.png'),
                const SizedBox(width: 10,),
                Text('Gemini GPT', style: Theme.of(context).textTheme.titleLarge)
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, index){
                final chat = _chats[index];
                return ListTile(
                    title: Align(
                      alignment: chat.isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: chat.isUser ?
                            AppColors.primary : AppColors.secondary,
                            borderRadius: chat.isUser ?
                            const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ) :
                            const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            )
                        ),
                        child: Text(
                            chat.text,
                            style: chat.isUser ? Theme.of(context).textTheme.bodyMedium :
                            Theme.of(context).textTheme.bodySmall
                        ),
                      ),
                    )
                );
              },
            ),
          ),

          // User Input
          Padding(
            padding: const EdgeInsets.only(bottom: 32, top: 16, left: 16, right: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3)
                  )
                ]
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: Theme.of(context).textTheme.titleSmall,
                      decoration: InputDecoration(
                          hintText: 'Write your message',
                          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.grey
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20)
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  _isLoading ?
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      ) :
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: GestureDetector(
                          onTap: callGeminiModel,
                          child: Image.asset('assets/send.png'),
                        ),
                      )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
