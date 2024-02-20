import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

//TODO: #38 Implement Records feature
@RoutePage()    
class IntelliRecords extends StatelessWidget {
  const IntelliRecords({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: const Center(
        child: Text(
          'Records',
        ),
      ),
    );
  }
}
