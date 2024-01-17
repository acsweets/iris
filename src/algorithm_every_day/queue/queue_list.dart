import 'queue.dart';

class QueueList<T> extends Queue<T> {
  final List<T> _list = [];

  @override
  T? dequeue() {
    return _list.removeAt(0);
  }

  @override
  void enqueue(T data) {
    _list.add(data);
  }

  @override
  T? front() {
    return _list[0];
  }

  @override
  int get size => _list.length;
}
