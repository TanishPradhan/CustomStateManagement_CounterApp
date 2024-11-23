import 'package:custom_state_management_counter_app/custom_inherited_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counterIndex = 0;

  void _incrementCounter() {
    setState(() {
      counterIndex++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return CustomInheritedWidget(
      counterIndex: counterIndex,
      incrementCounter: _incrementCounter,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterIndex = CustomInheritedWidget.of(context)!.counterIndex;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade100,
        title: const Text("Custom State Management Counter App", style: TextStyle(
          fontSize: 18.0,
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counterIndex.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: CustomInheritedWidget.of(context)?.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
