import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String author;

  const Footer({Key? key, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white70 : Colors.black87;
    return Column(
      children: [
        Text(
          'Made by: $author',
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor),
        ),
      ],
    );
  }
}
