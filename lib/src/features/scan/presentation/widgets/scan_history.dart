import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:intellibra/src/extensions/build_context.dart';

class ScanHistory extends StatefulWidget {
  const ScanHistory({super.key});

  @override
  State<ScanHistory> createState() => _ScanHistoryState();
}

class _ScanHistoryState extends State<ScanHistory> {
  @override
  Widget build(BuildContext context) {
    return HeatMap(
      colorMode: ColorMode.color,
      defaultColor: context.scheme.primaryContainer,
      startDate: DateTime.now().subtract(const Duration(days: 90)),
      endDate: DateTime.now(),
      scrollable: true,
      datasets: {
        DateTime(2024, 2, 6): 1,
        DateTime(2024, 2, 9): 1,
        DateTime(2024, 2, 12): 2,
        DateTime(2024, 2, 18): 3,
        DateTime(2024, 2, 19): 2,
      },
      colorsets: const {
        1: Color.fromARGB(255, 30, 174, 50),
        2: Color.fromARGB(255, 158, 156, 10),
        3: Color.fromARGB(255, 141, 36, 36),
      },
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
