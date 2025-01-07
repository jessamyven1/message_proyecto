import 'package:flutter/material.dart';
class MessageFieldBox extends StatelessWidget {

final ValueChanged<String> onValue;


  const MessageFieldBox({
    super.key,
    required this. onValue
    });

  @override
  Widget build(BuildContext context) {
   
   final textController= TextEditingController();
   final focusNode= FocusNode();

   final outlineInputBorder= UnderlineInputBorder(
       
       borderSide:  const BorderSide (color: Color.fromARGB(255, 235, 223, 223)),
       borderRadius: BorderRadius.circular(40)
   );

    final inputDecoration= InputDecoration(
        hintText: 'end your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffix: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: (){
          final textValue= textController.value.text;
         
          textController.clear();
          onValue(textValue);

        },
        
        ),
    );

    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller:textController,
      decoration: inputDecoration,
      onFieldSubmitted:(value){
        
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
       
    );
  }
}