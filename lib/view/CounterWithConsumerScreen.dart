import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/CounterProvider.dart';

class CounterWithConsumerScreen extends StatefulWidget {
  const CounterWithConsumerScreen({super.key});

  @override
  State<CounterWithConsumerScreen> createState() => _CounterWithConsumerScreenState();
}

class _CounterWithConsumerScreenState extends State<CounterWithConsumerScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      builder: (BuildContext context, _) {
        final counterProvider = Provider.of<CounterProvider>(context, listen: false);
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<CounterProvider>(
                  builder: (context, data, child) {
                    print('Update UI Consumer 1');
                    return Container(
                      height: 40,
                      color: Colors.red,
                      child: Center(child: Text('Consumer1: ${data.counter}')),
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Consumer<CounterProvider>(
                  builder: (context, data, child) {
                    print('Update UI Consumer 2');
                    return Container(
                      height: 40,
                      color: Colors.blue,
                      child: Center(child: Text('Consumer2: ${data.counter2}')),
                    );
                  },
                )
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton.extended(
                backgroundColor: Colors.red,
                onPressed: () {
                  counterProvider.increase2();
                },
                label: Text('Consumer 1'),
                icon: Icon(Icons.add),
              ),
              Expanded(child: SizedBox()),
              FloatingActionButton.extended(
                backgroundColor: Colors.blue,
                onPressed: () {
                  counterProvider.decrease2();
                },
                label: Text('Consumer 2'),
                icon: Icon(Icons.minimize),
              ),
            ],
          ),
        );
      },
    );
  }
}
