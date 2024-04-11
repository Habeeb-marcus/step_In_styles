import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'TAB: 0',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}