import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  final VoidCallback? onExpand;
  MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
        if (onExpand != null) {
          onExpand!();
        }
      },
      color: Theme.of(context).colorScheme.secondary,
      child: Text(text),
    );
  }
}
