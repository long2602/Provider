import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/CounterProvider.dart';

class CounterWithSelectorScreen extends StatefulWidget {
  const CounterWithSelectorScreen({super.key});

  @override
  State<CounterWithSelectorScreen> createState() => _CounterWithSelectorScreenState();
}

class _CounterWithSelectorScreenState extends State<CounterWithSelectorScreen> {
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
                Selector<CounterProvider, int>(
                  builder: (context, data, child) {
                    print('Update UI Consumer 1');
                    return Container(
                      height: 40,
                      color: Colors.red,
                      child: Center(child: Text('Consumer1: $data')),
                    );
                  },
                  selector: (buildContext, countPro) {
                    return countPro.counter;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Selector<CounterProvider, int>(
                  builder: (context, data, child) {
                    print('Update UI Consumer 2');
                    return Container(
                      height: 40,
                      color: Colors.blue,
                      child: Center(child: Text('Consumer2: $data')),
                    );
                  },
                  selector: (buildContext, counterProvider) => counterProvider.counter2,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton.extended(
                heroTag: null,
                backgroundColor: Colors.red,
                onPressed: () {
                  counterProvider.increase();
                },
                label: Text('Consumer 1'),
                icon: Icon(Icons.add),
              ),
              Expanded(child: SizedBox()),
              FloatingActionButton.extended(
                heroTag: null,
                backgroundColor: Colors.blue,
                onPressed: () {
                  counterProvider.increase2();
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
