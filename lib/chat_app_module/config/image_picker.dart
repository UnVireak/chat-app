// image_picker_helper.dart
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> browseImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: source);

  if (image == null) {
    return null;
  }

  Uint8List imageBytes = Uint8List.fromList(await image.readAsBytes());

  debugPrint('Original image size: ${imageBytes.lengthInBytes / 1024} KB');

  int quality;
  if (imageBytes.lengthInBytes > 1 * 1024 * 1024) {
    quality = 80;
  } else if (imageBytes.lengthInBytes > 0.5 * 1024 * 1024) {
    quality = 40;
  } else if (imageBytes.lengthInBytes > 300 * 1024) {
    quality = 80;
  } else {
    quality = 100;
  }

  var result = await FlutterImageCompress.compressWithList(
    imageBytes,
    quality: quality,
    format: CompressFormat.jpeg,
  );

  debugPrint('Compressed image size: ${result.lengthInBytes / 1024} KB');

  final tempFile = File(
    '${Directory.systemTemp.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
  );
  await tempFile.writeAsBytes(result);

  return XFile(tempFile.path);
}
