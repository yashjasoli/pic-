import 'package:flutter/material.dart';
import 'package:toy_tree_new/notifions/notification.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';

class AllNotification extends StatelessWidget {
  const AllNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Today'.toUpperCase()),
        NotificationBox(),
        Text('Yesterday'.toUpperCase()),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            color: golden.withOpacity(0.6),
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
          ),
        ),
        Text('older'.toUpperCase()),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            color: Colors.white,
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
              title: const Text('Unlimited Data on your'),
              subtitle: const Text('head: Airtel International Roaming '),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            color: golden.withOpacity(0.6),
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
              title: const Text('Unlimited Data on '),
              subtitle: const Text('head: Airtel International Roaming at 133/'),
            ),
          ),
        ),
      ],
    );
  }
}
