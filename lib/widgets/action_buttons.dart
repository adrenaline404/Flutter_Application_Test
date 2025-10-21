import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ActionButtons({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final borderColor = isDark
        ? Colors.white.withOpacity(0.3)
        : theme.colorScheme.primary.withOpacity(0.2);
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onEdit,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: borderColor, width: 2),
              ),
              backgroundColor: isDark
                  ? Colors.black
                  : theme.colorScheme.primary,
              elevation: 4,
              shadowColor: theme.colorScheme.secondary.withOpacity(0.2),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit, color: theme.colorScheme.onPrimary),
                  const SizedBox(width: 8),
                  Text(
                    'Edit',
                    style: TextStyle(color: theme.colorScheme.onPrimary),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: onDelete,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: borderColor, width: 2),
              ),
              backgroundColor: isDark ? Colors.black : theme.colorScheme.error,
              elevation: 4,
              shadowColor: theme.colorScheme.error.withOpacity(0.2),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete, color: theme.colorScheme.onError),
                  const SizedBox(width: 8),
                  Text(
                    'Delete',
                    style: TextStyle(color: theme.colorScheme.onError),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
