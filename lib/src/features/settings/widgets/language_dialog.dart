import 'package:flutter/material.dart';
import 'package:intellibra/src/extensions/build_context.dart';

class IntelliDialog extends StatelessWidget {
  const IntelliDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Change appli's language",
        style: context.theme.textTheme.headlineSmall,
      ),
      actions: [
        TextButton.icon(
          icon: const Icon(Icons.close_rounded),
          label: const Text('Close'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.check_circle),
          label: const Text('Validate'),
          onPressed: () {},
        ),
      ],
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Francais'),
          ),
          ListTile(
            title: Text('English'),
          ),
        ],
      ),
    );
  }
}
