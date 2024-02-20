import 'package:flutter/material.dart';

//TODO: #35 redesign self check page to make it modern
class SelfCheck extends StatelessWidget {
  const SelfCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text('Self-Check'),
        ),
      ),
    );
  }
}
