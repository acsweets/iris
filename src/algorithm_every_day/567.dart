///字符串的排列在dart  中我想使用栈传入一个String  类型的 "1+3+5*7+(10+5)="  完成四则运算的功能


import 'dart:collection';

double calculate(String expression) {
  Queue<double> numbers = Queue<double>();
  Queue<String> operators = Queue<String>();

  for (int i = 0; i < expression.length; i++) {
    String token = expression[i];
    if (token == ' ' || token == '=') {
      continue;
    } else if (token == '+' || token == '-' || token == '*' || token == '/') {
      while (operators.isNotEmpty && hasHigherPrecedence(operators.last, token)) {
        processTop(numbers, operators);
      }
      operators.addLast(token);
    } else if (token == '(') {
      operators.addLast(token);
    } else if (token == ')') {
      while (operators.isNotEmpty && operators.last != '(') {
        processTop(numbers, operators);
      }
      operators.removeLast(); // Remove '('
    } else {
      // Read the entire number
      String number = token;
      while (i + 1 < expression.length && isDigit(expression[i + 1])) {
        i++;
        number += expression[i];
      }
      numbers.addLast(double.parse(number));
    }
  }

  while (operators.isNotEmpty) {
    processTop(numbers, operators);
  }

  if (numbers.length == 1) {
    return numbers.first;
  } else {
    throw FormatException('Invalid expression');
  }
}

bool hasHigherPrecedence(String op1, String op2) {
  return (op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-');
}



bool isDigit(String s) {
  return double.tryParse(s) != null;
}

double performOperation(double a, double b, String op) {
  if (op == '+') {
    return a + b;
  } else if (op == '-') {
    return a - b;
  } else if (op == '*') {
    return a * b;
  } else if (op == '/') {
    return a / b;
  } else {
    throw ArgumentError('Invalid operator: $op');
  }
}

void processTop(Queue<double> numbers, Queue<String> operators) {
  if (operators.isNotEmpty && operators.last != '(') {
    double b = numbers.removeLast();
    double a = numbers.removeLast();
    String op = operators.removeLast();
    double result = performOperation(a, b, op);
    numbers.addLast(result);
  }
}

void main() {
  String expression = "1+3+5*7+(10+5)=";
  double result = calculate(expression);
  print(result);
}
