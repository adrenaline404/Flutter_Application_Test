import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ActionButtons({Key? key, required this.onEdit, required this.onDelete})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onEdit,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: theme.colorScheme.primary,
              elevation: 2,
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
              ),
              backgroundColor: theme.colorScheme.error,
              elevation: 2,
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
