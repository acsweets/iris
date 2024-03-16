const List<FileNode> defaultChildren = [];

class FileNode {

  String path;
  List<FileNode> children = [];

  FileNode({
    required this.path,
    this.children = defaultChildren,
  });

  static FileNode fromJson(Map<String, dynamic> json) {
    FileNode node = FileNode(
      path: json["path"],
      children: json["children"] == null ? [] : (json["children"] as List).map((e) => FileNode.fromJson(e)).toList(),
    );
    return node;
  }

  Map<String, dynamic> toJson() =>
      {
        "path": path,
        if (children.isNotEmpty) "children": children.map((e) => e.toJson()).toList(),
      };
}