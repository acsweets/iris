import 'circularqueue.dart';
import 'queue_list.dart';

void main() {
  // QueueList<int> queue = QueueList<int>();
  //
  // queue.enqueue(1);
  // queue.enqueue(9);
  // queue.enqueue(9);
  // queue.enqueue(4);
  // queue.enqueue(0);
  // print(queue.dequeue());
  // print(queue.dequeue());
  // print(queue.front());
  // print(queue.size);
  MyCircularQueue cq = MyCircularQueue(5);

  print(cq.enQueue(10)); // true
  print(cq.enQueue(20)); // true
  print(cq.enQueue(30)); // true
  print(cq.enQueue(40)); // true
  print(cq.enQueue(50)); // true
  print(cq.enQueue(60)); // false, because the queue is full

  print(cq.deQueue()); // 10
  print(cq.front() );  // 20
  print("队列是否空${cq.isEmpty()}"); // null, because the queue is empty

  print(cq.deQueue()); // 20
  print(cq.deQueue()); // 30
  print(cq.deQueue()); // 40
  print(cq.deQueue()); // 50
  print("队列是否空${cq.isEmpty()}"); // null, because the queue is empty

  print(cq.deQueue()); // null, because the queue is empty
}
