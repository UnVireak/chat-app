// image_picker_helper.dart
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> browseImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  try {
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      debugPrint('No image selected.');
      return null;
    }

    Uint8List imageBytes = await image.readAsBytes();
    debugPrint('Original image size: ${imageBytes.lengthInBytes / 1024} KB');

    int quality = imageBytes.lengthInBytes > 1 * 1024 * 1024
        ? 80
        : imageBytes.lengthInBytes > 0.5 * 1024 * 1024
            ? 40
            : imageBytes.lengthInBytes > 300 * 1024
                ? 80
                : 100;

    final compressedBytes = await FlutterImageCompress.compressWithList(
      imageBytes,
      quality: quality,
      format: CompressFormat.jpeg,
    );

    debugPrint('Compressed image size: ${compressedBytes.lengthInBytes / 1024} KB');

    final tempFile = File('${Directory.systemTemp.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg');
    await tempFile.writeAsBytes(compressedBytes);

    return XFile(tempFile.path);
  } catch (e) {
    debugPrint('Error picking image: $e');
    return null;
  }
}
