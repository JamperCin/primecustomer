import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class FileUtils {
  final String fileName;
  final String? filePath;

  ///Specify the file name to READ or WRITE to
  FileUtils({this.fileName = "regis.json", this.filePath});

  ///1. Find the correct local path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  ///2. Create a reference to the file location
  Future<File> get _localFile async {
    final path = await _localPath;
    return File(filePath ?? '$path/$fileName');
  }

  ///3. Write data to the file
  Future<File> writeData(String data) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(data);
  }

  ///4. Read data from the file
  Future<String> readData() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "";
    }
  }

  static Future<String> downloadFile(String? url, String fileName) async {
    if (url == null || url.isEmpty) {
      return "";
    }
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/$fileName";
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
