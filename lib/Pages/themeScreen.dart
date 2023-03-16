import 'package:flutter/material.dart';

class themeScreen extends StatefulWidget {
  const themeScreen({super.key});

  @override
  State<themeScreen> createState() => _themeScreenState();
}

class _themeScreenState extends State<themeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme өөрчлөх"),
      ),
      body: Column(),
    );
  }
}
