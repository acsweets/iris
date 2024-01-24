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
  print(fileTree);
}

class FileTree {
  final FileNode _root = FileNode('/');

  void add(String path) {
    List<String> paths = path.trim().split('/');
    paths.removeWhere((element) => element == "");
    String _path = "";
    FileNode node = _root;
    for (String element in paths) {
      _path += "/$element";
      FileNode addNode = FileNode(_path);
      node.children.add(addNode);
      node = addNode;
    }
  }
}

class FileNode {
  String path;
  List<FileNode> children = [];

  FileNode(this.path);
}
