import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/bread_crumb_provider.dart';
import 'package:provider_example/create_new_crumb.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BreadCrumbProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider State demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Provider Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const CreateNewCrumb())));
              }),
              child: const Text('Add new bread crumb')),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                context.read<BreadCrumbProvider>().reset();
              },
              child: const Text("Reset"))
        ],
      ),
    );
  }
}
