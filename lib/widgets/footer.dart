import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String author;

  const Footer({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface.withOpacity(0.25);
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 8),
      child: Center(
        child: Text(
          'Created By: $author',
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
