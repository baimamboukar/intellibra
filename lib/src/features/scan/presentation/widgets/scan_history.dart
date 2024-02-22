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
      defaultColor: context.scheme.primaryContainer.withOpacity(.85),
      startDate: DateTime.now().subtract(const Duration(days: 90)),
      endDate: DateTime.now(),
      showColorTip: false,
      scrollable: true,
      size: 15.5,
      colorTipCount: 4,
      datasets: {
        DateTime(2024, 2, 6): 1,
        DateTime(2024, 2, 9): 6,
        DateTime(2024, 2, 12): 2,
        DateTime(2024, 2, 18): 3,
        DateTime(2024, 2, 19): 2,
      },
      colorsets: {
        1: context.colorScheme.primary.withOpacity(.45),
        3: context.colorScheme.primary.withOpacity(.7),
        6: context.colorScheme.primary.withOpacity(.95),
      },
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
