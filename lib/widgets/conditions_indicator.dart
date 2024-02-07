import 'package:flutter/material.dart';

class ContditionsIndicator extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String textValue;
  const ContditionsIndicator({super.key, required this.imageUrl, required this.description, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
          height: 32,
          color: Colors.white70,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 13,
                fontFamily: 'BeVietnamThin',
              ),
            ),
            Text(
              textValue,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
