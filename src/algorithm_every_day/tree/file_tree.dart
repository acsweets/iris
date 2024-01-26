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
  fileTree.printFileTree();
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
    printNode(_root);
  }

  printNode(FileNode node) {
    print(node.path);
    for (var element in node.children) {
      printNode(element);
    }
  }
}

class FileNode {
  String path;
  List<FileNode> children = [];

  FileNode(this.path);
}
