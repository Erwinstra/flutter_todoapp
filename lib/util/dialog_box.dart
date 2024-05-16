import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final Function() onSave;
  final Function() onCancel;
  final TextEditingController? controller;
  const DialogBox({
    super.key,
    required this.onSave,
    this.controller,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      actionsPadding: const EdgeInsets.all(20),
      actions: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Add new task here..',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onSave,
              child: const Text('Save'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onCancel,
              child: const Text('Cancel'),
            )
          ],
        )
      ],
    );
  }
}
