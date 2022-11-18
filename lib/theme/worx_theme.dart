import 'package:flutter/material.dart';

class WorxThemeData {
  static const _defaultFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _defaultFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData defaultThemeData = themeData(defaultColorScheme, _defaultFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      primaryColor: colorScheme.primary,
      colorScheme: colorScheme,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _defaultFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.titleMedium?.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme defaultColorScheme = ColorScheme(
    primary: Color(0xFFDA3630),
    primaryContainer: Color(0xFF117378),
    secondary: Color(0xFFEFF3F3),
    secondaryContainer: Color(0xFFFAFBFB),
    background: Color(0x33000000),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _defaultFillColor,
    onError: _defaultFillColor,
    onPrimary: _defaultFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryContainer: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryContainer: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF), // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static final Color dividerColor = Color(0xFFF0F0F0);

  static final TextTheme _textTheme = TextTheme(
    // headlineMedium: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    // bodySmall: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
    headlineSmall: TextStyle(fontFamily:'RobotoMono', fontWeight: FontWeight.w400, fontSize: 16.0),
     titleMedium: TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.w500, fontSize: 18.0),
    // labelSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    // bodyLarge: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    // titleSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
     bodyMedium: TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.w400, fontSize: 14.0),
    // titleLarge: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    // labelLarge: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );
}