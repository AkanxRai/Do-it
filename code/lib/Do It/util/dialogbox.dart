
import 'package:flutter/material.dart';
import 'package:to_do/Do%20It/util/mybutton.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  double boxHeight = 35;
  double boxWidth = 80;

  void _expand() {
    setState(() {
      boxHeight = 45;
      boxWidth = 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                )),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedContainer(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 500),
                  height: boxHeight,
                  width: boxWidth,
                  child: MyButton(
                      onPressed: widget.onSave,
                      onExpand: _expand,
                      text: "Save"),
                ),
                const SizedBox(width: 8),
                MyButton(onPressed: widget.onCancel, text: "Cancel"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
