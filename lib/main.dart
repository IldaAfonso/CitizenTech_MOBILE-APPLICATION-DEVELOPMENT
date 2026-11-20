import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/idosos_screen.dart';
import 'screens/idoso_detalhe_screen.dart';
import 'screens/eventos_screen.dart';
import 'screens/novo_evento_screen.dart';
import 'screens/sobre_screen.dart';

void main() => runApp(const CitizenTechApp());

class CitizenTechApp extends StatelessWidget {
  const CitizenTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CitizenTech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1565C0),
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/idosos': (_) => const IdososScreen(),
        '/idoso': (_) => const IdosoDetalheScreen(),
        '/eventos': (_) => const EventosScreen(),
        '/novo-evento': (_) => const NovoEventoScreen(),
        '/sobre': (_) => const SobreScreen(),
      },
    );
  }
}
