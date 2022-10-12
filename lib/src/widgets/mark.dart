import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intellibra/src/utils/palette.dart';

class TradeMark extends StatelessWidget {
  const TradeMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Intelli',
                style: TextStyle(
                  color: Palette.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Bra',
                style: GoogleFonts.besley(
                  color: Palette.tertiary,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Text(
            'v1.0.0',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
