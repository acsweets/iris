import 'stack_list/stack_list.dart';

/// 使用栈校验括号是否闭合
///
///

//({[()]})true
//({[(]})false

void main() {
  String first = "({[()]})";
  String second = "({[(]})";

  print(isClosure(first.split('')));
  print(isClosure(second.split('')));
}

bool isClosure(List<String> brackets) {
  StackList<String> stack = StackList();

  for (var element in brackets) {
    stack.push(element);
  }

  while (brackets.isNotEmpty) {
    if (brackets.first == negate(stack.peek()!)) {
      brackets.removeAt(0);
      stack.pop();
    } else {
      return false;
    }
  }
  return true;
}

var symbolMap = {'(': ')', ')': '(', '[': ']', ']': '[', '{': '}', '}': '{'};

String negate(String symbol) {
  return symbolMap[symbol]??'';
}
