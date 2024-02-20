import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()    
class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Choose your preferred language'),
      ),
    );
  }
}
