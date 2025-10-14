import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_test/profile_page.dart';

void main() {
  testWidgets('ProfilePage renders and shows title', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ProfilePage()));
    // Pastikan AppBar judul ada
    expect(find.text('My Profile'), findsOneWidget);
    // Pastikan tombol Edit ada
    expect(find.text('Edit'), findsOneWidget);
    // Pastikan tombol Delete ada
    expect(find.text('Delete'), findsOneWidget);
  });
}
