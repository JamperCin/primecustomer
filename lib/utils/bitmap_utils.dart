import 'dart:io' as Io;
import 'dart:convert';

class BitmapUtils {
  static String encodeImageToBase64(String path) {
    final bytes = Io.File(path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    return img64;
  }

  static String decodeImageFromBase64(String base64) {
    final decodedBytes = base64Decode(base64);
    var file = Io.File("decodedImage.png");
    file.writeAsBytesSync(decodedBytes);
    print("BASE ${file.path}");
    return file.path;
  }
}
