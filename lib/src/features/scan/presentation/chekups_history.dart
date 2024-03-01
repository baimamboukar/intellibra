import 'package:flutter/material.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/scan_history.dart';

class CheckupsHistory extends StatefulWidget {
  const CheckupsHistory({super.key});

  @override
  State<CheckupsHistory> createState() => _CheckupsHistoryState();
}

class _CheckupsHistoryState extends State<CheckupsHistory> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ScanHistory(),
        ],
      ),
    );
  }
}
