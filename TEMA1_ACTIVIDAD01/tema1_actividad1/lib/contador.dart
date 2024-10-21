import 'package:flutter/material.dart';
import 'package:tema1_actividad1/main.dart';

class Contador extends StatelessWidget {
  const Contador({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contador'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavegacionDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Has apretado el boton tantas veces:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 80,
            right: 10,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              heroTag: 'increment',
              child: Icon(Icons.add),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              heroTag: 'decrement',
              child: Icon(Icons.remove),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: FloatingActionButton(
              onPressed: _resetCounter,
              tooltip: 'Reset',
              heroTag: 'reset',
              child: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
