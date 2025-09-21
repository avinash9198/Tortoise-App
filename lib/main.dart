import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';

void main() {
  runApp(DevicePreview(builder: (context) => TortoiseApp()));
}

class TortoiseApp extends StatelessWidget {
  const TortoiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tortoise UI',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const DashboardPage(),
    );
  }
}
