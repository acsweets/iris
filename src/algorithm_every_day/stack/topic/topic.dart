import '../stack_list/stack_list.dart';

/// 使用栈校验括号是否闭合
///

class StackTopic {
  //使用栈校验括号是否闭合
  static bool isClosure(List<String> brackets) {
    StackList<String> stack = StackList();

    for (String element in brackets) {
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

  static const Map symbolMap = {'(': ')', ')': '(', '[': ']', ']': '[', '{': '}', '}': '{'};

  //符号取反
  static String negate(String symbol) {
    return symbolMap[symbol] ?? '';
  }

  /// (()())(())(()(())) 用栈删除最外层括号
  /// 如果字符是左括号，我们将其添加到栈中。如果栈的长度不为0（这意味着这不是最外层的左括号），
  /// 我们将其添加到结果字符串中。如果字符是右括号，我们从栈中弹出一个元素。如果弹出后栈的长度不为0
  ///（这意味着这不是最外层的右括号），我们将其添加到结果字符串中。最后，我们返回结果字符串。
  ///
  ///老师我实在没思路问了ai下思路  代码都是自己写的嗷嗷 ~~~
  static String removeOutermostBracket(List<String> symbol) {
    StackList<String> stack = StackList();
    String result = "";
    for (String element in symbol) {
      if (element == "(") {
        if (stack.isNotEmpty) result += element;
         stack.push(element);
      } else if (element == ")") {
           stack.pop();
        if (stack.isNotEmpty) result += element;
      }
    }
    return result;
  }
}
