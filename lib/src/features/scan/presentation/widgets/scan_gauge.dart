import 'package:flutter/material.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScanGauge extends StatelessWidget {
  const ScanGauge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138,
      width: 128,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            interval: 10,
            showLabels: false,
            // showTicks: false,
            pointers: <GaugePointer>[
              RangePointer(
                value: 72,
                width: 8,
                color: context.scheme.primary,
                enableAnimation: true,
                cornerStyle: CornerStyle.bothCurve,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      color: context.scheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '50%',
                            style: context.bodyLg.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'of scans',
                            style: context.bodySm.copyWith(
                              //   fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
