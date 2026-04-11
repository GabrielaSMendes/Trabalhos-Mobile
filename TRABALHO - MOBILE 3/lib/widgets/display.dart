import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String texto;

  const Display({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(20),
        color: Colors.black,
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}