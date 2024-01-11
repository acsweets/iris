
import 'binary_search/binary_search_tree.dart';
import 'tree_printer.dart';

/// create by 星星 on 2024/1/1
/// contact me by email 1395723441@qq.com
/// 说明:

void main() {
  BinarySearchTree tree1 = BinarySearchTree<int>.fromArray([11,6,8,9,3,12,16,2,]);
  BinarySearchTree tree2 = BinarySearchTree<int>.fromArray([4,8,2,9,7,14,18,5,]);

BinarySearchTree tree = BinarySearchTree<int>();
  // tree.printTree();
  // TreePrinter().printTreeNode(tree.root,0);
  // print("${tree.findMax()}");
  // print("${tree.findMin()}");

   // TreePrinter().printTreeNode(tree.mergeTrees(tree1.root, tree2.root),0);
  // print("${tree2.toList()}");
  tree = tree2.copy();
  TreePrinter().printTreeNode(tree.root,0);

}
