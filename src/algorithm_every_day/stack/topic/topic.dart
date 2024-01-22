import 'dart:math';

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

  //s = "(1+(2*3)+((8)/4))+1"  输出括号的最大嵌套深度  3

  static int maxNestingDepth(List<String> symbol) {
    StackList<String> stack = StackList();
    int maxDepth = 0;
    for (String element in symbol) {
      if (element == "(") {
        stack.push(element);
        maxDepth = max(maxDepth, stack.size);
      } else if (element == ")") {
        stack.pop();
      }
    }
    return maxDepth;
  }

  //2788拆分字符串[数组题]
//：words = ["one.two.three","four.five","six"], separator = "."
// 输出：["one","two","three","four","five","six"]
  static List<String> splitString(List<String> words, String separator) {
    List<String> result = [];
    for (String element in words) {
      result.addAll(element.split(separator));
    }
    return result;
  }

  //完成四则运算   加减乘除
  //思路：匹配的符号 + - * /  ( )  =  [] 表示字符集合, ^ 在字符集合中表示否定,也就是不匹配集合中的字符  \d 匹配数字 0-9
  //括号是一个整体    先乘除  后加 减

  static Map operator = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    '*': (a, b) => a * b,
    '/': (a, b) => a / b,
  };

  //这个函数会遍历输入的字符串，然后根据字符的类型进行不同的操作。如果字符是数字，就更新当前的数字。
  // 如果字符是加号或减号，就更新结果和符号。如果字符是乘号或除号，就计算当前的数字和下一个数字的乘积或商。
  // 如果字符是左括号，就把结果和符号压入栈中。如果字符是右括号，就从栈中弹出符号和结果，然后更新结果。最后，返回结果。

  static int fourOperations(String expression) {
    RegExp regExp = RegExp(r"[-+*/()=]|\d+(\d)?");
    List<String> symbols = regExp.allMatches(expression).map((e) => e.group(0)!).toList();
    int? result = 0;
    // List<String> symbols = expression.split(RegExp(r"[-+*/()=]|\d+?"));
    // List<String> symbols = expression.split(RegExp(r'[^\D]'));
    StackList<String> stack = StackList();
    for (String element in symbols) {
      if (isDigit(element)) {
        if (stack.isEmpty) {
          if (stack.peek() == "+") {
            stack.pop();
            result = int.parse(element) + int.parse(stack.pop()!);
          }
          if (stack.peek() == "-") {
            stack.pop();
            result = int.parse(element) - int.parse(stack.pop()!);
          }
          stack.push(result.toString());
        } else {
          stack.push(element);
        }
      } else if (element == "+" || element == "-") {
        stack.push(element);
      } else if (element == "*") {
        int.parse(stack.pop()!) ;

      } else if (element == "(") {
      } else if (element == ")") {
      } else if (element == "=") {
        // return stack.pop() ?? 0;
      }
    }
    return 0;
  }

  //判断当前字符是否位数字
  static bool isDigit(String input) {
    RegExp digit = RegExp(r'^\d+$');
    return digit.hasMatch(input);
  }

}
