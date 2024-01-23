//MyCircularQueue(k): 构造器，设置队列长度为 k 。
//Front: 从队首获取元素。如果队列为空，返回 -1 。
//Rear: 获取队尾元素。如果队列为空，返回 -1 。
//enQueue(value): 向循环队列插入一个元素。如果成功插入则返回真。
//deQueue(): 从循环队列中删除一个元素。如果成功删除则返回真。
//isEmpty(): 检查循环队列是否为空。
//isFull(): 检查循环队列是否已满。

class MyCircularQueue {
  List<int> _queue;
  int _head = -1;
  int _tail = -1;
  final int _size;

  MyCircularQueue(this._size) : _queue = List<int>.filled(_size, -1);

//enQueue(value): 向循环队列插入一个元素。如果成功插入则返回真。
//环形队列的关键就是使用 pos = (pos + 1) % n 这种取模操作来实现循环绕回头指针
  ///[完成插入操作]
  bool enQueue(int value) {
    if (isFull()) {
      return false;
    }
    if (isEmpty()) {
      _head = 0;
    }
    _tail = (_tail + 1) % _size;
    _queue[_tail] = value;
    return true;
  }

//deQueue(): 从循环队列中删除一个元素。如果成功删除则返回真。
  bool deQueue() {
    if (isEmpty()) {
      return false;
    }
    if (_head == _tail) {
      _head = -1;
      _tail = -1;
    } else {
      _head = (_head + 1) % _size;
    }
    return true;
  }

//Front: 从队首获取元素。如果队列为空，返回 -1 。
  int front() {
    if (isEmpty()) {
      return -1;
    }
    return _queue[_head];
  }

//Rear: 获取队尾元素。如果队列为空，返回 -1 。
  int rear() {
    if (isEmpty()) {
      return -1;
    }
    else {
      return _queue[_tail];
    }
  }

  bool isEmpty() {
    return _head == -1;
  }
//isFull(): 检查循环队列是否已满。
  bool isFull() {
    return (_tail + 1) % _size == _head;
  }
}
