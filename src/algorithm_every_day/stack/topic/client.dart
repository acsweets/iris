import 'topic.dart';

///(()())(())(()(())) 用栈删除最外层括号

//({[()]})true
//({[(]})false

void main() {
  String first = "({[()]})";
  String second = "({[(]})";

  print(StackTopic.isClosure(first.split('')));
  print(StackTopic.isClosure(second.split('')));
  //结果应该 ()()()  ()(())
  String third = "(()())(())(()(()))";
  print(StackTopic.removeOutermostBracket(third.split('')));

}