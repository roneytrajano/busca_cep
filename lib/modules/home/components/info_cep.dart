import 'package:flutter/material.dart';

class InfoCep extends StatelessWidget {
  const InfoCep({Key? key, required this.icon, required this.text}) : super(key: key);

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 5,
        ),
        Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color.fromRGBO(99, 99, 99, 1)),),
      ],
    );
  }
}
