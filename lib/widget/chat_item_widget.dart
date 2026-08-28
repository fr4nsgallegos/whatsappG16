import 'package:flutter/material.dart';

class ChatItemWidget extends StatelessWidget {
  String name;
  String message;
  String time;
  String initials;
  final int unread;
  ChatItemWidget({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.initials,
    this.unread = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.green.shade600,
        child: Text(initials, style: TextStyle(fontWeight: FontWeight.bold)),
      ),

      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: unread > 0 ? Colors.green : Colors.grey,
            ),
          ),
          SizedBox(height: 5),
          if (unread > 0)
            Container(
              alignment: Alignment.center,
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Text(
                unread.toString(),
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
        ],
      ),
    );
  }
}
