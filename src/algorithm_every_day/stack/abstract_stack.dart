abstract class Stack<T>{

  int get size;

  /// 入栈
  push(T data);

  /// 出栈
  T? pop();

  /// 查看栈顶元素
  T? peek();
}