import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:river_exam2/counter.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod exam 2 Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

final counterProvider = StateNotifierProvider<Counter, int?>(
  (ref) => Counter(),
);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod exam 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (context, ref, child) {
                final counter = ref.watch(counterProvider);
                final text =
                    counter == null ? "Press the button" : counter.toString();
                return Text(
                  text,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).increament();
                },
                child: const Text('Increase counter')),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).decreament();
                },
                child: const Text('decrease counter')),
          ],
        ),
      ),
    );
  }
}
