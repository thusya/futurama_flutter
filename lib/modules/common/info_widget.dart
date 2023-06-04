import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String message;

  const InfoWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
