import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Palette Variables
  static const Color bgDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF2d2e2b);
  static const Color borderMuted = Color(0xFF50605a);
  static const Color accentSecondary = Color(0xFF81938a);
  static const Color primaryMint = Color(0xFFb9cabe);
  static const Color textLight = Color(0xFFebf1ed);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bgDark,
      
      textTheme: GoogleFonts.poppinsTextTheme(
        const TextTheme(
          bodyLarge: TextStyle(color: textLight),
          bodyMedium: TextStyle(color: textLight),
          titleLarge: TextStyle(color: textLight, fontWeight: FontWeight.bold),
        ),
      ),

      colorScheme: const ColorScheme.dark(
        primary: primaryMint,
        secondary: accentSecondary,
        surface: surfaceDark,
        onPrimary: bgDark, // Text color on primary buttons (Mint background -> Dark text)
        onSurface: textLight, // Text color on cards
      ),

      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: bgDark,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: textLight),
        titleTextStyle: TextStyle(
          color: textLight, 
          fontSize: 20, 
          fontWeight: FontWeight.w600
        ),
      ),

      // Filled Button (e.g., Sign In, Mark as Paid)
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryMint,
          foregroundColor: bgDark, // Dark text on mint button
          minimumSize: const Size(double.infinity, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryMint,
          side: const BorderSide(color: primaryMint, width: 1.5),
          minimumSize: const Size(double.infinity, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      // Text Input Fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceDark,
        hintStyle: const TextStyle(color: accentSecondary),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none, // Clean look without borders by default
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryMint, width: 1.5),
        ),
      ),

// Cards
      cardTheme: CardThemeData( 
        color: surfaceDark,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: borderMuted, width: 0.5), // Subtle border
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surfaceDark,
        selectedItemColor: primaryMint,
        unselectedItemColor: borderMuted,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      // Chips (for Active, Paid, Overdue statuses)
      chipTheme: ChipThemeData(
        backgroundColor: surfaceDark,
        labelStyle: const TextStyle(color: textLight, fontWeight: FontWeight.w500),
        side: const BorderSide(color: borderMuted),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

// UI/UX Color Mapping Strategy:
// #121212 (Background Dark): Yeh aapki app ka main canvas/background (Scaffold) hoga.
// #2d2e2b (Surface Dark): Yeh Cards, Bottom Navigation Bar, aur TextFields ke background ke liye use hoga taake background se thoda upar (elevated) feel ho.
// #50605a (Muted Border): Inactive icons, TextFields ki borders, aur list dividers ke liye.
// #81938a (Accent Secondary): Progress bars ka background track ya sub-titles (secondary text) ke liye.
// #b9cabe (Primary Mint): Yeh aapka "Call to Action" color hai. Main buttons (FilledButton), active tab icons, aur important stats (jaise revenue ya total users) is color mein honge.
// #ebf1ed (Text Light): Main headings aur body text ke liye pure white ki jagah yeh soft off-white use hoga, jo dark mode mein aankhon par sukoon deta hai.
