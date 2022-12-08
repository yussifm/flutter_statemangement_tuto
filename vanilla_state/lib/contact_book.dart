import 'package:vanilla_state/contact_model.dart';

class ContactBooks {
  ContactBooks._sharedInstance();
  static final ContactBooks _shared = ContactBooks._sharedInstance();

  factory ContactBooks() => _shared;

  final List<ContactModel> _contacts = [];

  int get length => _contacts.length;

  void add({required ContactModel contact}) {
    _contacts.add(contact);
  }

  void remove({required ContactModel contact}) {
    _contacts.remove(contact);
  }

  ContactModel? contactAtIndex({required int atIndex}) {
    return _contacts.length > atIndex ? _contacts[atIndex] : null;
  }
}
