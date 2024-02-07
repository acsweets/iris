import '../../error/tree_error.dart';
import 'file_tree_node.dart';

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



class FileTree {
  FileNode _root = FileNode(path: '/');

  FileTree();

  factory FileTree.fromJsonToTree(Map<String, dynamic> json) {
    FileTree tree = FileTree();
    tree.fromJson(json);
    return tree;
  }

  void fromJson(Map<String, dynamic> json) {
    _root = FileNode.fromJson(json);
  }

  void add(String path) {
    List<String> paths = path.trim().split('/');
    FileNode parent = _root;
    String _path = "";
    for (String part in paths) {
      if (part == '') continue;
      _path += "/$part";
      FileNode addNode = FileNode(path: _path);
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
      return FileNode(path: path);
    }
    String path = "/${parts.sublist(0, depth + 1).join('/')}";
    List<FileNode> children = parent.children;
    FileNode node = FileNode(path: path);
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
      if (exist) return true;
    }
    return false;
  }

  printNode(FileNode node, String result) {
    print(result + node.path);
    result += "--|";
    for (var element in node.children) {
      printNode(element, result);
    }
  }

//  删除一个叶子节点的路径文件
  void deleteNode(String path) {
    if (!_deleteNode(_root, path)) {
      throw CustomError("删除失败");
    }
  }

  bool _deleteNode(FileNode node, String path) {
    List<FileNode> removeNode = node.children.where((element) => element.path == path).toList();
    if (removeNode.isNotEmpty) {
      for (FileNode element in removeNode) {
        node.children.remove(element);
      }
      return true;
    } else {
      for (FileNode element in node.children) {
          bool delete = _deleteNode(element, path);
          if (delete) return true;
      }
      return false;
    }
  }

  // 判断是否是叶子节点
  bool isLeaf(FileNode node) {
    return node.children.isEmpty;
  }


//生成json文件
  Map<String, dynamic> treeToJSON() {
    return _root.toJson();
  }


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
}

