//递归去算斐波那契数列

//1，1，2，3，5，8，13，21

void main() {
  print(fibonacci(3));
  print(fibIteration(3));
}

//错误代码
int fibonacci(int n) {
  if (n == 0) return 0;
  int i = 1;
  n = n - 1;
  return i + fibonacci(n);
}

int fib(int n) {
  // 终止条件 f(1) = 0, f(2) = 1
  if (n == 1 || n == 2) return n - 1;
  // 递归调用 f(n) = f(n-1) + f(n-2)
  int res = fib(n - 1) + fib(n - 2);
  // 返回结果 f(n)
  return res;
}

int fibIteration(int n) {
  int result = 0;
  for (int i = 1; i < n; i++) {
    result = result + i;
  }
  return result;
}
