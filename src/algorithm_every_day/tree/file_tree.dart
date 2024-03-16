/// 设计一个 FileTree 的文件树结构
/// 每个节点持有若干个 FileNode 节点
///
/// 完成 add 方法，解析路径添加文件节点
/// 例: 添加文件 /root/home/hell0.txt
/// 树形节点：
///  根: /
///      children: /root
///         children: /root/home
///            children: /root/home/hell0.txt

void main() {
  FileTree fileTree = FileTree();
  fileTree.add('/root/home/hell0.txt');
  fileTree.add('/root/home/hell1.txt');
  fileTree.add('/root/home/hell3.txt');
  fileTree.add('/root/pages/page1.txt');
  fileTree.add('/root/pages/page2.txt');

  fileTree.printFileTree();


  print("${fileTree.existence('/root/pages/page2.txt')}");
  print("${  fileTree.existence('/root/pages/page3.txt')}");

}

class FileTree {
  final FileNode _root = FileNode('/');

  
  // void add(String path) {
  //   List<String> paths = path.trim().split('/');
  //   paths.removeWhere((element) => element == "");
  //   String _path = "";
  //   FileNode node = _root;
  //   for (String element in paths) {
  //     _path += "/$element";
  //     FileNode addNode = FileNode(_path);
  //
  //     node.children.add(addNode);
  //     node = addNode;
  //   }
  // }

  void add(String path) {
    List<String> paths = path.trim().split('/');
    FileNode parent = _root;
    String _path = "";
    for (String part in paths) {
      if (part == '') continue;
      _path += "/$part";
      FileNode addNode = FileNode(_path);
      parent = parent.children.firstWhere((element) => element.path == _path, orElse: () {
        parent.children.add(addNode);
        return addNode;
      });
    }
  }

  void addFile(String path) {
    Uri uri = Uri.parse(path);
    addNode(_root, uri.pathSegments, 0);
  }

  FileNode addNode(FileNode parent, List<String> parts, int depth) {
    if (depth == parts.length) {
      String path = "/${parts.join('/')}";
      return FileNode(path);
    }
    String path = "/${parts.sublist(0, depth + 1).join('/')}";
    List<FileNode> children = parent.children;
    FileNode node = FileNode(path);
    Iterable<FileNode> targets = children.where((e) => e.path == path);
    if (targets.isNotEmpty) {
      addNode(parent, parts, depth);
    } else {
      parent.children.add(addNode(node, parts, depth + 1));
    }
    return parent;
  }

  printFileTree() {
    String result = "";
    printNode(_root, result);
  }

  //判断文件是否存在
  bool existence(String path) {
    return _existence(_root, path);
  }

  //当前节点需要做的事情
  bool _existence(FileNode node, String path) {
    if (path == node.path) {
      return true;
    }
    for (FileNode element in node.children) {
      bool exist = _existence(element, path);
      if(exist) return true;
    }
    return false ;
  }

  printNode(FileNode node, String result) {
    print(result + node.path);
    result += "--|";
    for (var element in node.children) {
      printNode(element, result);
    }
  }
}

class FileNode {
  String path;
  List<FileNode> children = [];

  FileNode(this.path);
}
