import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({
    super.key,
   required this.message
   });

  final Message message;


  @override
  Widget build(BuildContext context) {
    final colors= Theme.of(context).colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
             

          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: Text(
              message.text,
               style: TextStyle(color: Colors.black ),),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(message.imageUl !),

        const SizedBox(height:10),
        // Todo: imagen
      ],
    );
  }
}


class _ImageBubble extends StatelessWidget {

  final String imageUl;
  const _ImageBubble(this.imageUl);
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
      imageUl,
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if(loadingProgress== null) return child;
        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text('Mi jefe esta enviando un gif'),
          

        );
      },
      ));
  }
}