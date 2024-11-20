import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_200187/domain/entities/message.dart';

import 'package:yes_no_app_200187/persentation/providers/chat_provider.dart';
import 'package:yes_no_app_200187/persentation/widgets/chat/other_message_bubble.dart';
import 'package:yes_no_app_200187/persentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_200187/persentation/widgets/shared/message_field_box.dart';

class ChastScreen extends StatelessWidget {
  const ChastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images2.minutemediacdn.com/image/upload/c_crop,w_5156,h_2900,x_0,y_214/c_fill,w_1200,ar_4:3,f_auto,q_auto,g_auto/images/GettyImages/mmsport/90min_es_international_web/01fkjy2hw2nkkbkm65mk.jpg'),
          ),
        ),
        title: Text('Mi Barca❤️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),

            /// Caja de texto de mensajes
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
