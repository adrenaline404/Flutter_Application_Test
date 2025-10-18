import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String author;

  const Footer({Key? key, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white70 : Colors.black87;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          // Dikosongkan dulu biar clear
          '',
          style: TextStyle(color: textColor, fontSize: 14),
        ),
      ),
    );
  }
}
