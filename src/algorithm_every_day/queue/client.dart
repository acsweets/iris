import 'queue_list.dart';

void main() {
  QueueList<int> queue = QueueList<int>();

  queue.enqueue(1);
  queue.enqueue(9);
  queue.enqueue(9);
  queue.enqueue(4);
  queue.enqueue(0);
  print(queue.dequeue());
  print(queue.dequeue());
  print(queue.front());
  print(queue.size);

}
