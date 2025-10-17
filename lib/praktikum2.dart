import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key}) {
    // TODO: implement MyWidget
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.person),
      title: Text('Shofwan Zhilaludin'),
      subtitle: Text('Flutter Developer'),
    ),
    ListTile(
      leading: Icon(Icons.person),
      title: Text('Budi'),
      subtitle: Text('UI Designer'),
    ),
  ],
);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}