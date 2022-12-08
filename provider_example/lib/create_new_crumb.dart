import 'package:flutter/material.dart';

class CreateNewCrumb extends StatefulWidget {
  const CreateNewCrumb({super.key});

  @override
  State<CreateNewCrumb> createState() => _CreateNewCrumbState();
}

class _CreateNewCrumbState extends State<CreateNewCrumb> {
  late TextEditingController _textControllr;

  @override
  void initState() {
    _textControllr = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textControllr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _textControllr,
            decoration: const InputDecoration(hintText: "Add your crumb here"),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(onPressed: (() {}), child: const Text("Add crumb"))
        ],
      ),
    );
  }
}
