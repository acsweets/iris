import 'file_tree.dart';

void main() {
  FileTree fileTree = FileTree();
  // fileTree.add('/root/home/hell0.txt');
  // fileTree.add('/root/home/hell1.txt');
  // fileTree.add('/root/home/hell3.txt');
  // fileTree.add('/root/pages/page1.txt');
  // fileTree.add('/root/pages/page2.txt');
  //
  // fileTree.printFileTree();

  // print("${fileTree.existence('/root/pages/page2.txt')}");
  // print("${fileTree.existence('/root/pages/page3.txt')}");
  // fileTree.deleteNode('/root/pages/page2.txt');
  // fileTree.printFileTree();
  //
  // print(fileTree.treeToJSON());

  Map<String, dynamic> json = {
    "path": "/",
    "children": [
      {
        "path": "/root",
        "children": [
          {
            "path": "/root/home",
            "children": [
              {"path": " /root/home/hello.txt"}
            ]
          },
          {
            "path": "/root/toly",
            "children": [
              {"path": " /root/toly/hello.txt"}
            ]
          }
        ]
      }
    ]
  };
  FileTree tree = FileTree.fromJsonToTree(json);

  tree.printFileTree();
}