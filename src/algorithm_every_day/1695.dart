///删除子数组的最大得分
///

import 'dart:collection';

int calculate(String s) {
  Queue<int> stack = Queue<int>();
  int num = 0;
  int result = 0;
  int sign = 1;
  for (int i = 0; i < s.length; i++) {
    int codeUnit = s.codeUnitAt(i);
    if (codeUnit >= 48 && codeUnit <= 57) {
      num = num * 10 + (codeUnit - 48);
    } else if (codeUnit == 43) {
      result += sign * num;
      num = 0;
      sign = 1;
    } else if (codeUnit == 45) {
      result += sign * num;
      num = 0;
      sign = -1;
    } else if (codeUnit == 42 || codeUnit == 47) {
      int nextNum = 0;
      int j = i + 1;
      while (j < s.length && s.codeUnitAt(j) >= 48 && s.codeUnitAt(j) <= 57) {
        nextNum = nextNum * 10 + (s.codeUnitAt(j) - 48);
        j++;
      }
      num = codeUnit == 42 ? num * nextNum : num ~/ nextNum;
      i = j - 1;
    } else if (codeUnit == 40) {
      stack.addLast(result);
      stack.addLast(sign);
      result = 0;
      sign = 1;
    } else if (codeUnit == 41) {
      result += sign * num;
      num = 0;
      result *= stack.removeLast();
      result += stack.removeLast();
    }
  }
  result += sign * num;
  return result;
}

void main() {
  print(calculate("1+3+5*7+(10+5)=")); // 输出结果
}
