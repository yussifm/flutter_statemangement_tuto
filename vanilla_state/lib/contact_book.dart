import 'package:flutter/cupertino.dart';
import 'package:vanilla_state/contact_model.dart';

class ContactBooks extends ValueNotifier<List<ContactModel>> {
  ContactBooks._sharedInstance() : super([]);
  static final ContactBooks _shared = ContactBooks._sharedInstance();

  factory ContactBooks() => _shared;

  final List<ContactModel> _contacts = [];

  int get length => _contacts.length;

  void add({required ContactModel contact}) {
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
    // _contacts.add(contact);
    // notifyListeners();
  }

  void remove({required ContactModel contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();

      // _contacts.remove(contact);
      // notifyListeners();
    }
  }

  ContactModel? contactAtIndex({required int atIndex}) {
    return value.length > atIndex ? value[atIndex] : null;
  }
}
