import 'package:flutter/material.dart';

class StatusItemWidget extends StatelessWidget {
  final String name;
  final String time;
  final String initials;

  StatusItemWidget({
    super.key,
    required this.name,
    required this.time,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Text(initials),
        ),
      ),
      title: Text(name, style: TextStyle(fontWeight: .bold)),
      subtitle: Text(time),
    );
  }
}
