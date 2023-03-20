import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData baseLightTheme = ThemeData.light(useMaterial3: true);
final ThemeData baseDarkTheme = ThemeData.dark(useMaterial3: true);
final TextTheme baseTextTheme = GoogleFonts.secularOneTextTheme();
final TextTheme baseLightTextTheme = baseTextTheme.copyWith(
  displayLarge: baseTextTheme.displayLarge?.copyWith(color: Colors.white),
  displayMedium: baseTextTheme.displayMedium?.copyWith(color: Colors.white),
  displaySmall: baseTextTheme.displaySmall?.copyWith(color: Colors.white),
  headlineLarge: baseTextTheme.headlineLarge?.apply(color: Colors.white),
  headlineMedium: baseTextTheme.headlineMedium?.copyWith(color: Colors.white),
  headlineSmall: baseTextTheme.headlineSmall?.copyWith(color: Colors.white),
  titleLarge: baseTextTheme.titleLarge?.copyWith(color: Colors.white),
  titleMedium: baseTextTheme.titleMedium?.copyWith(color: Colors.white),
  titleSmall: baseTextTheme.titleSmall?.copyWith(color: Colors.white),
  bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: Colors.white),
  bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: Colors.white),
  bodySmall: baseTextTheme.bodySmall?.copyWith(color: Colors.white),
  labelLarge: baseTextTheme.labelLarge?.copyWith(color: Colors.white),
  labelMedium: baseTextTheme.labelMedium?.copyWith(color: Colors.white),
  labelSmall: baseTextTheme.labelSmall?.copyWith(color: Colors.white),
);
final TextTheme baseDarkTextTheme = baseTextTheme.copyWith(
  displayLarge: baseTextTheme.displayLarge?.copyWith(color: Colors.white),
  displayMedium: baseTextTheme.displayMedium?.copyWith(color: Colors.white),
  displaySmall: baseTextTheme.displaySmall?.copyWith(color: Colors.white),
  headlineLarge: baseTextTheme.headlineLarge?.copyWith(color: Colors.white),
  headlineMedium: baseTextTheme.headlineMedium?.copyWith(color: Colors.white),
  headlineSmall: baseTextTheme.headlineSmall?.copyWith(color: Colors.white),
  titleLarge: baseTextTheme.titleLarge?.copyWith(color: Colors.white),
  titleMedium: baseTextTheme.titleMedium?.copyWith(color: Colors.white),
  titleSmall: baseTextTheme.titleSmall?.copyWith(color: Colors.white),
  bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: Colors.white),
  bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: Colors.white),
  bodySmall: baseTextTheme.bodySmall?.copyWith(color: Colors.white),
  labelLarge: baseTextTheme.labelLarge?.copyWith(color: Colors.white),
  labelMedium: baseTextTheme.labelMedium?.copyWith(color: Colors.white),
  labelSmall: baseTextTheme.labelSmall?.copyWith(color: Colors.white),
);

const seed = Color(0xff305055);

const MaterialColor kPrimarySwatch = MaterialColor(
  0xff77c9d4,
  <int, Color>{
    50: Color(0xff6bb5bf), //10%
    100: Color(0xff5fa1aa), //20%
    200: Color(0xff538d94), //30%
    300: Color(0xff47797f), //40%
    400: Color(0xff3c656a), //50%
    500: Color(0xff305055), //60%
    600: Color(0xff243c40), //70%
    700: Color(0xff18282a), //80%
    800: Color(0xff0c1415), //90%
    900: Color(0xff000000), //100%
  },
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF77c9d4),
  onPrimary: Colors.white,
  primaryContainer: Color(0xFF004F56),
  onPrimaryContainer: Color(0xFF8EF2FF),
  secondary: Color(0xFF57BC90),
  onSecondary: Colors.white,
  secondaryContainer: Color(0xFF005137),
  onSecondaryContainer: Color(0xFF8AF8C5),
  tertiary: Color(0xFFB3C5FF),
  onTertiary: Color(0xFF002A76),
  tertiaryContainer: Color(0xFF224290),
  onTertiaryContainer: Color(0xFFDBE1FF),
  error: Color(0xFFD83F87),
  errorContainer: Color(0xFF93000A),
  onError: Colors.white,
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF3A485A),
  onBackground: Color(0xFFD6E3FF),
  surface: Color(0xFF001B3D),
  onSurface: Color(0xFFD6E3FF),
  surfaceVariant: Color(0xFF3F484A),
  onSurfaceVariant: Color(0xFFBEC8CA),
  outline: Color(0xFF899294),
  onInverseSurface: Color(0xFF001B3D),
  inverseSurface: Color(0xFFD6E3FF),
  inversePrimary: Color(0xFF006972),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4ED8E8),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF77c9d4),
  onPrimary: Colors.white,
  primaryContainer: Color(0xFF004F56),
  onPrimaryContainer: Color(0xFF8EF2FF),
  secondary: Color(0xFF57BC90),
  onSecondary: Colors.white,
  secondaryContainer: Color(0xFF005137),
  onSecondaryContainer: Color(0xFF8AF8C5),
  tertiary: Color(0xFFB3C5FF),
  onTertiary: Color(0xFF002A76),
  tertiaryContainer: Color(0xFF224290),
  onTertiaryContainer: Color(0xFFDBE1FF),
  error: Color(0xFFD83F87),
  errorContainer: Color(0xFF93000A),
  onError: Colors.white,
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF3A485A),
  onBackground: Color(0xFFD6E3FF),
  surface: Color(0xFF001B3D),
  onSurface: Color(0xFFD6E3FF),
  surfaceVariant: Color(0xFF3F484A),
  onSurfaceVariant: Color(0xFFBEC8CA),
  outline: Color(0xFF899294),
  onInverseSurface: Color(0xFF001B3D),
  inverseSurface: Color(0xFFD6E3FF),
  inversePrimary: Color(0xFF006972),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4ED8E8),
);

IconThemeData appLightIconTheme =
    baseLightTheme.iconTheme.copyWith(color: lightColorScheme.secondary);

IconThemeData appDarkIconTheme =
    baseDarkTheme.iconTheme.copyWith(color: lightColorScheme.primary);

CardTheme appLightCardTheme =
    baseLightTheme.cardTheme.copyWith(color: const Color(0xA6505E6E));
CardTheme appDarkCardTheme =
    baseLightTheme.cardTheme.copyWith(color: const Color(0xA6505E6E));

ThemeData appLightTheme = baseLightTheme.copyWith(
    colorScheme: lightColorScheme,
    textTheme: baseLightTextTheme,
    iconTheme: appLightIconTheme,
    cardTheme: appLightCardTheme,
    scaffoldBackgroundColor: lightColorScheme.background);
ThemeData appDarkTheme = baseDarkTheme.copyWith(
    colorScheme: darkColorScheme,
    iconTheme: appDarkIconTheme,
    textTheme: baseDarkTextTheme,
    cardTheme: appDarkCardTheme,
    scaffoldBackgroundColor: darkColorScheme.background);
