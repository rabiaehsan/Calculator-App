import 'package:flutter/material.dart';

class button_widget extends StatefulWidget {
  final String data;
  final Color color;
  final VoidCallback onpressed;
  const button_widget(
      {super.key,
      required this.data,
      required this.onpressed,
      this.color = Colors.grey});

  @override
  State<button_widget> createState() => _button_widgetState();
}

// ignore: camel_case_types
class _button_widgetState extends State<button_widget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onpressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pinkAccent,
            ),
            child: Center(
              child: Text(
                widget.data,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
