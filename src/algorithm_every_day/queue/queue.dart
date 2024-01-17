
abstract class Queue<T>{

  int get size;

  /// 入队
  void enqueue(T data);

  /// 出队
  T? dequeue();

  /// 查看队首元素
  T? front();
}