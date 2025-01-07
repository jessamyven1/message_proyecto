import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_messenger_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://pbs.twimg.com/media/EmboogyXUAIxCII.jpg:large"),
        ),
      ),
      title: Text('Mi jefe'),
      centerTitle:true,
     ),
     body: _ChatView(),

    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

     final chatProvider= context.watch<ChatProvider>();



    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController ,
               itemCount: chatProvider.messageList.length,
                itemBuilder:(context, index){
                  final message= chatProvider.messageList[index];

                  return (message.fromWho== FromWho.hers)
                  ? HerMessageBubble(message: message)
                  : MyMessengeBubble( message: message);

               

              }
              ),
            ),

            /// caja de texto de mensajes 
           MessageFieldBox(
            onValue:(value)=> chatProvider.sendMessage(value),
           ),
            
          ]
        ),
      ),
    );
  }
}
