import 'package:hooks_riverpod/hooks_riverpod.dart';

extension OptioninfixAdditionWithNull<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }

  T? operator -(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow - (other ?? 0) as T;
    } else {
      return null;
    }
  }
}

class Counter extends StateNotifier<int?> {
  Counter() : super(null);
  void increament() => state = state == null ? 0 : state + 1;
  void decreament() => state = state == null ? 0 : state - 1;
}
