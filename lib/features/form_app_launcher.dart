import 'package:flutter/material.dart';
import '../screens/home_page.dart';

class FormAppLauncher extends StatelessWidget {
  const FormAppLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white.withOpacity(0.18), width: 2),
      ),
      color: theme.colorScheme.surface,
      child: ListTile(
        leading: Icon(Icons.assignment, color: theme.colorScheme.primary),
        title: Text(
          'Form App',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Navigasi, State Management & Validasi Form',
          style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.7)),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: theme.colorScheme.primary,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
      ),
    );
  }
}
