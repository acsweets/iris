import 'dart:io';
import 'package:path/path.dart' as path;
import 'res.dart';

main() async {
  readFile();
}

Future<void> writeFile() async {
  String path = Directory.current.path;
  //判断当前目录下是否存在目标文件夹，没有就创建一个
  String targetPath = "$path/assets";
  Directory directory = Directory(targetPath);
  bool exists = await directory.exists(); //判断文件是否存在
  if (!exists) {
    //如果有下级就需要递归创建
    await directory.create();
  }
  File file = File("$targetPath/1001.txt");
  await file.create();

  file.writeAsString(data);
}

Future<void> readFile() async {
  String rootDirPath = Directory.current.path;
  //判断当前目录下是否存在目标文件夹，没有就创建一个
  String targetPath = "$rootDirPath/assets";
  Directory directory = Directory(targetPath);
  bool exists = await directory.exists(); //判断文件是否存在
  if (!exists) {
    //如果有下级就需要递归创建
    await directory.create();
  }
  File file = File("$targetPath/1001.txt");
  // String file1001 = await file.readAsString();
  // print(file1001);
  List<String> file1001 = await file.readAsLines();
  List<String> ret = [];
  int emptyCount = 0;
  for (String line in file1001) {
    if (line.isNotEmpty) {
      ret.add("第${ret.length + 1-emptyCount}夜 $line\n");
    } else {
      ret.add("\n");
      emptyCount++;
    }
  }

  //文件夹的名称
  String filename = path.basenameWithoutExtension(file.path);
  String outPath = path.join(file.parent.path, "$filename-out.txt");
  File fileRet = File(outPath);
  fileRet.writeAsString(ret.join());
}
