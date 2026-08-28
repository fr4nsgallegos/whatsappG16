import 'package:flutter/material.dart';
import 'package:whatsappg16/widget/status_item_widget.dart';

class StatusTabPage extends StatelessWidget {
  const StatusTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Stack(
            children: [
              CircleAvatar(radius: 27, child: Icon(Icons.person)),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, size: 18, color: Colors.white),
                ),
              ),
            ],
          ),
          title: Text(
            "Mi estado",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Toca para añadir actualización"),
        ),

        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Actualizaciones recientes",
            style: TextStyle(color: Colors.grey, fontWeight: .bold),
          ),
        ),

        StatusItemWidget(
          name: "Jhonny Gallegos",
          time: "Hoy, 10:30",
          initials: "JG",
        ),
        StatusItemWidget(name: "Lucho", time: "Hoy, 15:30", initials: "L"),
      ],
    );
  }
}
