///给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。

///解集 不能 包含重复的子集。返回的解集中，子集可以按 任意顺序 排列。

//示例 1：
//输入：nums = [1,2,2]
//输出：[[],[1],[1,2],[1,2,2],[2],[2,2]]
//示例 2：
//输入：nums = [0]
//输出：[[],[0]]

void main() {
  print(subset(num));
}

List<int> num = [1, 2, 2];
//没做出来  钉住
List<List<int>> subset(List<int> num) {
  List<List<int>> result = [
    [],
  ];
  for (int i = 1; i < num.length; i++) {
    List<int> sub = [];
    for (int j = 0; j < i; j++) {
      sub.add(num[j]);
    }
    result.add(sub);
  }

  return result;
}


