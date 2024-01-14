import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String label;
  final int chatIndex;
  const ChatWidget({
    super.key,
    required this.label,
    required this.chatIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 2),
      child: Column(
        children: [
          Material(
            color: chatIndex == 0
                ? Colors.transparent
                : const Color.fromARGB(255, 71, 69, 69),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: chatIndex != 0
                        ? const Icon(Icons.circle)
                        : const Icon(Icons.person),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          chatIndex != 0
                              ? const Text(
                                  'ChatGPT',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )
                              : const Text(
                                  'You',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                          Text(
                            label,
                            style: const TextStyle(fontSize: 17),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
