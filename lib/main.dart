import 'package:flutter/material.dart';
import 'profile_with_bottom_nav.dart';

// Modern dynamic black theme palette
const Color kPrimaryColor = Color(0xFF212121); // true black
const Color kAccentColor = Color(0xFF00B4D8); // vibrant cyan
const Color kSurfaceDark = Color(0xFF2A2A40); // dark surface
const Color kBackgroundDark = Color(0xFF181A20); // background
const Color kCardDark = Color(0xFF23232F); // card color
const Color kErrorColor = Color(0xFFEF476F); // error pink

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;

  ThemeData get _darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kBackgroundDark,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(color: kAccentColor),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: kAccentColor,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      error: kErrorColor,
      onError: Colors.white,
      background: kBackgroundDark,
      onBackground: Colors.white,
      surface: kSurfaceDark,
      onSurface: Colors.white,
    ),
    cardColor: kCardDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kAccentColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: kSurfaceDark,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      labelStyle: const TextStyle(color: kAccentColor),
      hintStyle: const TextStyle(color: Colors.white54),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: kAccentColor, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: kAccentColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kSurfaceDark,
      selectedItemColor: kAccentColor,
      unselectedItemColor: Colors.white54,
      showUnselectedLabels: true,
    ),
    dividerColor: Colors.white12,
  );

  ThemeData get _lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: kAccentColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(color: kAccentColor),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: kAccentColor,
      onPrimary: Colors.white,
      secondary: Colors.black,
      onSecondary: Colors.white,
      error: kErrorColor,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    cardColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kAccentColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      labelStyle: const TextStyle(color: kAccentColor),
      hintStyle: const TextStyle(color: Colors.black54),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: kAccentColor, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: kAccentColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kAccentColor,
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
    ),
    dividerColor: Colors.black12,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: ProfileWithBottomNav(
        themeSwitcher: Switch(
          value: isDark,
          onChanged: (val) => setState(() => isDark = val),
          activeColor: kAccentColor,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.white24,
        ),
      ),
    );
  }
}
