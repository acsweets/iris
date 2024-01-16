
abstract class Stack<T>{

  int get size;

  /// 入栈
  push(T data);

  /// 出栈
  T? pop();

  /// 查看栈顶元素
  T? peek();
}
void main(){
  Stack<int> stack = StackList();
  stack.push(1);
  stack.push(9);
  stack.push(9);
  stack.push(4);
  stack.push(3);
  print("===大小:${stack.size}=====栈顶:${stack.peek()}==========");
  int? popped = stack.pop();
  print("===弹出:$popped");
  print("===大小:${stack.size}=====栈顶:${stack.peek()}==========");
}

class StackList<T> extends Stack<T>{
final int maxSize = 5;
final List<T> _items = [];

@override
  void push(T item) {
  if (_items.length == maxSize){
    _items.removeAt(0);
    print("Stack满 弹出 ${_items[0]} ");
  }
  _items.add(item);

}

  @override
  T? peek() {
  if(_items.isNotEmpty){
    print("Stack 栈顶为${_items.last!}");
    return _items.last!;
  }else{
    print("Stack 为空");
    return null;
  }
  }

  @override
  T? pop() {
    if(_items.isNotEmpty){
      return _items.removeLast();
    }else{
      print("Stack 为空");
      return null;
    }
  }

  @override
  int get size => _items.length;

}