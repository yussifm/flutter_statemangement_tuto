import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod exam4 Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

const names = [
  'Alice',
  'coded',
  'studio',
  'David',
  'Fred',
  'Larry',
  'Razak',
  'Waris',
];

final tickerProvider = StreamProvider(
  ((ref) => Stream.periodic(
        const Duration(seconds: 1),
        (i) => i + 1,
      )),
);

final namesProvider = StreamProvider(
  ((ref) => ref.watch(tickerProvider.stream).map(
        (count) => names.getRange(0, count),
      )),
);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(namesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('riverpod exam 4'),
      ),
      body: Center(
          child: names.when(
              data: ((name) {
                return ListView.builder(
                    itemCount: name.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(
                          name.elementAt(index),
                        ),
                      );
                    }));
              }),
              error: ((error, stackTrace) =>
                  const Text('Reached the end of the list!')),
              loading: () => const CircularProgressIndicator.adaptive())),
    );
  }
}
