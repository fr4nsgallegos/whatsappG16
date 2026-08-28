import 'package:flutter/material.dart';
import 'package:whatsappg16/widget/chat_item_widget.dart';

class ChatsTabPage extends StatelessWidget {
  const ChatsTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatItemWidget(
          name: "Jhonny Gallegos",
          message: "Hola como estas queria pedirte cosas pero no tepedi",
          time: "Ayer",
          initials: "GM",
        ),
        ChatItemWidget(
          name: "María Mendoza",
          message: "Hola como estas queria pedirte cosas pero no tepedi",
          time: "Hoy",
          initials: "MM",
          unread: 2,
        ),
      ],
    );
  }
}
