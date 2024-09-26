import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/view_model/CounterProvider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${context.watch<CounterProvider>().counter}"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().decrease();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                ),
                child: Icon(Icons.minimize),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().restart();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                ),
                child: Icon(Icons.restart_alt),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().increase();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                ),
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
