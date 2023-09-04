import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 29, 29, 29),
  dividerColor: const Color.fromARGB(255, 49, 47, 47),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.amber),
    backgroundColor: Color.fromARGB(255, 29, 29, 29),
    foregroundColor: Color.fromARGB(255, 29, 29, 29),
    titleTextStyle: TextStyle(
      color: Colors.amber,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    centerTitle: true,
  ),
  textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.amber,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      )),
);
