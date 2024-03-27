import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intellibra/src/configs/palette.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  static const routeName = '/chat';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _chatHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            //get max height
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
              itemCount: _chatHistory.length,
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Align(
                    alignment: (_chatHistory[index]['isSender'] == true
                        ? Alignment.topRight
                        : Alignment.topLeft),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: (_chatHistory[index]['isSender'] == true
                            ?  Palette.primary.withOpacity(0.7)
                            : Colors.white),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        _chatHistory[index]['message'] as String,
                        style: TextStyle(
                          fontSize: 15,
                          color: _chatHistory[index]['isSender'] == true
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: const Border.fromBorderSide(
                          BorderSide(color: Colors.transparent),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Palette.primary.withOpacity(0.5),
                            Palette.lightColor,
                          ],
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Type a message',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8),
                          ),
                          controller: _chatController,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        if (_chatController.text.isNotEmpty) {
                          _chatHistory.add({
                            'time': DateTime.now(),
                            'message': _chatController.text,
                            'isSender': true,
                          });
                          _chatController.clear();
                        }
                      });
                      _scrollController.jumpTo(
                        _scrollController.position.maxScrollExtent,
                      );

                      getAnswer();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    padding: const EdgeInsets.all(0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFF69170),
                            Color(0xFF7D96E6),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 88,
                          minHeight: 36,
                        ), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getAnswer() async {
    const url =
        'https://generativelanguage.googleapis.com/v1beta2/models/chat-bison-001:generateMessage?key=AIzaSyBEZJtbm464AMs9sxbCBhtwVNX8BOhRdbU';
    final uri = Uri.parse(url);
    final msg = <Map<String, String>>[];
    for (var i = 0; i < _chatHistory.length; i++) {
      msg.add({'content': _chatHistory[i]['message'] as String});
    }

    final request = <String, dynamic>{
      'prompt': {
        'messages': [msg],
      },
      'temperature': 0.25,
      'candidateCount': 1,
      'topP': 1,
      'topK': 1,
    };

    final response = await http.post(uri, body: jsonEncode(request));

    setState(() {
      _chatHistory.add({
        'time': DateTime.now(),
        'message': json.decode(response.body)['candidates'][0]['content'],
        'isSender': false,
      });
    });

    _scrollController.jumpTo(
      _scrollController.position.maxScrollExtent,
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    super.key,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
