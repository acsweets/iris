import 'topic.dart';

///(()())(())(()(())) 用栈删除最外层括号

//({[()]})true
//({[(]})false

void main() {
  String first = "({[()]})";
  String second = "({[(]})";
  String third = "(()())(())(()(()))";

  String four = "(1+(2*3)+((8)/4))+1";
  // print(StackTopic.isClosure(first.split('')));
  // print(StackTopic.isClosure(second.split('')));
  //结果应该 ()()()  ()(())
  // print(StackTopic.removeOutermostBracket(third.split('')));
 //结果 3
  print(StackTopic.maxNestingDepth(four.split('')));

}