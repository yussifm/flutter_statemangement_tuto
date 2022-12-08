import 'package:flutter/material.dart';
import 'package:vanilla_state/contact_book.dart';
import 'package:vanilla_state/contact_model.dart';
import 'package:vanilla_state/new_contact_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Vanila state Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
      routes: {
        newContactRouteName: (context) => const NewContactView(),
      },
    );
  }
}

ContactBooks contactBook = ContactBooks();

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
      body: ValueListenableBuilder(
          valueListenable: ContactBooks(),
          builder: (context, value, child) {
            final contacts = value;
            return ListView.builder(
                itemCount: contactBook.length,
                itemBuilder: ((context, index) {
                  final contact = contacts[index];
                  return Dismissible(
                    key: ValueKey(contact.id),
                    onDismissed: (direction) {
                      contacts.remove(contact);
                    },
                    child: ListTile(
                      title: Text(contact.name),
                    ),
                  );
                }));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(newContactRouteName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
