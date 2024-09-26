import 'package:flutter/material.dart';
import 'package:state/view/CounterWithSelectorScreen.dart';

void main() {
  // runApp(ChangeNotifierProvider(create: (context) => CounterProvider(), child: const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterWithSelectorScreen(),
    );
  }
}
