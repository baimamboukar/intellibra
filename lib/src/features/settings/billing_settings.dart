import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BillingSettings extends StatelessWidget {
const BillingSettings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('billing settings'),
      ),
      body: Container(),
    );
  }
}