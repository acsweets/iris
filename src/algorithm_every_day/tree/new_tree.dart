import 'tree_node.dart';

enum ErgodicType {
  preface,
  middleOrder,
  postOrder,
}

void main() {
  // TreeNode rightLLLL = TreeNode(val: "permissionHandler");
  // TreeNode leftLLLL = TreeNode(val: "permissionHandler");
  // TreeNode rightLLL = TreeNode(val: "baseFlow", left: rightLLLL);
  // TreeNode leftLLL = TreeNode(val: "baseFlow", left: leftLLLL);
  // TreeNode rightLL = TreeNode(val: "com", left: rightLLL);
  // TreeNode leftLL = TreeNode(val: "com", left: leftLLL);
  // TreeNode rightL = TreeNode(val: "classes", left: rightLL);
  // TreeNode leftL = TreeNode(val: "classes", left: leftLL);
  // TreeNode right = TreeNode(val: "release", left: rightL);
  // TreeNode left = TreeNode(val: "debug", left: leftL);
  // TreeNode node = TreeNode(val: "javac", left: left, right: right);
  // TreeNode rightC = TreeNode(val: "G");
  // TreeNode leftC = TreeNode(val: "F");
  // TreeNode rightB = TreeNode(val: "E");
  // TreeNode leftB = TreeNode(val: "D");
  // TreeNode right = TreeNode(val: "C", left: leftC, right: rightC);
  // TreeNode left = TreeNode(val: "B", left: leftB, right: rightB);
  // TreeNode node = TreeNode(val: "A", left: left, right: right);
  Map<String, dynamic> map = {
    "val": 1,
    "id": "00000000001",
    "left": {
      "id": "00000000002",
      "val": 9,
      "left": {"id": "00000000003", "val": 9},
      "right": {"id": "00000000004", "val": 4}
    },
    "right": {
      "id": "00000000005",
      "val": 0,
      "left": {
        "id": "00000000006",
        "val": 3,
        "left": {"id": "00000000007", "val": 2}
      },
      "right": {"id": "00000000008", "val": 8}
    }
  };
  TreeNode treeNode;
  treeNode = TreeNode.formJson(map)!;
  treeNode['00000000003'] = 6;
  // NewTree tree = NewTree(treeNode!);
  // tree.printTree();

  // tree.ergodic(ErgodicType.preface);
  // tree.ergodic(ErgodicType.middleOrder);
  // tree.ergodic(ErgodicType.postOrder);
  print(treeNode.toJson());
}

class NewTree<T> {
  final TreeNode<T> _newNode;

  NewTree(this._newNode);

  TreeNode get node => _newNode;

  void printTree() {
    printTreeNode(_newNode, 0);
  }

  List<int> nodesDepth = [];

  void printTreeNode(TreeNode? node, int depth) {
    if (node == null) {
      return;
    }
    String result = "";
    int i = 0;
    if (node.left != null && node.right != null) {
      nodesDepth.add(depth + 1);
    }
    while (i < depth) {
      if (i == 0 || (nodesDepth.contains(i) && node.right != null)) {
        result += "| ";
      } else {
        result += "  ";
      }
      i++;
    }
    result += "|_";

    result += node.val.toString();
    print("$result");

    printTreeNode(node.left, depth + 1);
    printTreeNode(node.right, depth + 1);
  }

  void ergodic(ErgodicType ergodicType) {
    switch (ergodicType) {
      case ErgodicType.preface:
        result.clear();
        prefaceTraversal(_newNode);
        print("前序$result");
        break;
      case ErgodicType.middleOrder:
        result.clear();
        middleOrderTraversal(_newNode);
        print("中序$result");
        break;
      case ErgodicType.postOrder:
        result.clear();
        sequentialTraversal(_newNode);
        print("后序$result");
        break;
    }
  }

  List<T> result = [];

//前序遍历
  void prefaceTraversal(TreeNode? node) {
    if (node == null) {
      return;
    }
    result.add(node.val);
    prefaceTraversal(node.left);
    prefaceTraversal(node.right);
  }

//中序遍历
  void middleOrderTraversal(TreeNode? node) {
    if (node == null) {
      return;
    }
    middleOrderTraversal(node.left);
    result.add(node.val);
    middleOrderTraversal(node.right);
  }

  //后序遍历
  void sequentialTraversal(TreeNode? node) {
    if (node == null) {
      return;
    }
    sequentialTraversal(node.left);
    sequentialTraversal(node.right);
    result.add(node.val);
  }

  void set(String id) {}

  void traversal(TreeNode? node, ErgodicType type) {
    if (type == ErgodicType.preface) result.add(node?.val);
    traversal(node?.left,type);
    if (type == ErgodicType.middleOrder) result.add(node?.val);
    traversal(node?.right,type);
    if (type == ErgodicType.postOrder) result.add(node?.val);
  }
}

//前序遍历
//中序遍历
