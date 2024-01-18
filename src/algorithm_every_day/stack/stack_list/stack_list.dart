import '../abstract_stack.dart';

class StackList<T> extends Stack<T> {
  final List<T> _items = [];

  @override
  void push(T item) {
    _items.add(item);
  }

//顶
  @override
  T? peek() {
    if (_items.isNotEmpty) {
      return _items.last!;
    } else {
      return null;
    }
  }

//弹出
  @override
  T? pop() {
    if (_items.isNotEmpty) {
      return _items.removeLast();
    } else {
      print("Stack 为空");
      return null;
    }
  }

  @override
  int get size => _items.length;

  bool get isEmpty => _items.isEmpty;
}
