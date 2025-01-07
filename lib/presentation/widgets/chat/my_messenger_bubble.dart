import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessengeBubble extends StatelessWidget {
   final Message message;

  const MyMessengeBubble({
    super.key,
    required this.message
    });

  @override
  Widget build(BuildContext context) {
    final colors= Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 171, 231, 174),
            borderRadius: BorderRadius.circular(20)

          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: Text(
              message.text,
               style: TextStyle(color: Colors.black ),),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}