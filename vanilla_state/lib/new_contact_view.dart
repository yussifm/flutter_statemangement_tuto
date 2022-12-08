import 'package:flutter/material.dart';
import 'package:vanilla_state/contact_book.dart';
import 'package:vanilla_state/contact_model.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({super.key});

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

const String newContactRouteName = '/new-contact';

class _NewContactViewState extends State<NewContactView> {
  late final TextEditingController _txtController;

  @override
  void initState() {
    _txtController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new contact'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: _txtController,
            decoration: const InputDecoration(
                hintText: 'Enter a new contact name here'),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {
                final contact = ContactModel(name: _txtController.text);
                ContactBooks().add(contact: contact);
                Navigator.of(context).pop();
              },
              child: const Text('Add contacts'))
        ],
      ),
    );
  }
}
