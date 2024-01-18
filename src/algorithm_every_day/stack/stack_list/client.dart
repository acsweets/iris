import '../abstract_stack.dart';
import 'stack_list.dart';

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