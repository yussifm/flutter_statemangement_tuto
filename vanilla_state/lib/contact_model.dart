import 'package:uuid/uuid.dart';

class ContactModel {
  final String id;
  final String name;
  ContactModel({required this.name}) : id = const Uuid().v4();
}
