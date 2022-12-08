import 'package:uuid/uuid.dart';

class BreadCrumb {
  bool isActive;
  final String name;
  final String id;
  BreadCrumb({required this.isActive, required this.name})
      : id = const Uuid().v4();

  void active() {
    isActive = true;
  }

  @override
  bool operator ==(covariant BreadCrumb other) => id == other.id;

  @override
  int get hashCode => id.hashCode;

  String get title => name + (isActive ? ' > ' : '');
}
