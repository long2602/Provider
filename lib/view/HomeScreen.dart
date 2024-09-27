import 'package:flutter/material.dart';
import 'package:state/view/CounterScreen.dart';
import 'package:state/view/CounterWithConsumerScreen.dart';
import 'package:state/view/CounterWithSelectorScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterScreen(),
                  ));
            },
            child: Text("Basic"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterWithConsumerScreen(),
                  ));
            },
            child: Text("Consumer"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterWithSelectorScreen(),
                  ));
            },
            child: Text("Selector"),
          ),
        ],
      ),
    );
  }
}
