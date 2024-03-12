import 'package:flutter/material.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.notifications_none,
          ),
        ),
        title: const Text('Unlimited Data on your next trip abroad'),
        subtitle: const Text('head: Airtel International Roaming at 133/'),
      ),
    );
  }
}
