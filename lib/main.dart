import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);

/// setState -> StatefulBuilder -> ValueListenableBuilder
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('test'),
            Text('data'),

            /// setState -> local state
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       _counter++;
            //     });
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: Text(
            //       'Tap here to add 10',
            //       style: TextStyle(
            //         color: Colors.blue,
            //         decoration: TextDecoration.underline,
            //       ),
            //     ),
            //   ),
            // ),

            /// StatefulBuilder -> local state
            // StatefulBuilder(
            //   builder: (context, innerSetState) {
            //     return Column(
            //       children: [
            //         Text(
            //           '$_counter',
            //           style: Theme.of(context).textTheme.headlineMedium,
            //         ),
            //         InkWell(
            //           onTap: () {
            //             innerSetState(() {
            //               _counter++;
            //             });
            //           },
            //           child: const Padding(
            //             padding: EdgeInsets.all(8.0),
            //             child: Text(
            //               'Tap here to add 10',
            //               style: TextStyle(
            //                 color: Colors.blue,
            //                 decoration: TextDecoration.underline,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // ),

            /// ValueListenableBuilder -> global state
            ValueListenableBuilder(
              valueListenable: counterNotifier,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            InkWell(
              onTap: () {
                counterNotifier.value++;
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Tap here to add 10',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: counterNotifier,
              builder: (context, value, child) {
                return Text(
                  'Text 2 $value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DemoScreen()),
                );
              },
              child: const Text('Go to Demo Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Screen')),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: counterNotifier,
            builder: (context, value, child) {
              return Text(
                '$value',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              counterNotifier.value++;
            },
            child: const Text('Add 5'),
          ),
        ],
      ),
    );
  }
}
