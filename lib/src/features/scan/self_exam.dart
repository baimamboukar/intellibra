import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

//TODO: #35 redesign self check page to make it modern
@RoutePage()    
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
