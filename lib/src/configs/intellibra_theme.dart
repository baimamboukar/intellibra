import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

class IntellibraTheme {
  static ThemeData get light => _getTheme(Brightness.light);
  static ThemeData get dark => _getTheme(Brightness.dark);
}

ThemeData _getTheme(Brightness brightness) => ThemeData(
      useMaterial3: true,
      // brightness: brightness,
      fontFamily: 'Agrandir',
      colorScheme: SeedColorScheme.fromSeeds(
        brightness: Brightness.dark,
        primary: const Color(0xFFDA015F),
        primaryKey: const Color(0xFFDA015F),
        secondary: const Color(0xFF626262),
        tertiary: const Color(0xFF1B2121),
        background: const Color(0xFFFF96A7),
        tones: FlexTones.vivid(Brightness.light),
      ),
    );
