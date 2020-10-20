// ignore_for_file: avoid_print
import 'dart:io';
import 'package:path/path.dart';

const String _IMAGE_ASSET_GENERATION_PATH = '../../lib/constants';
const String _IMAGE_FOLDER = '../../assets';

void main(List<String> args) {
  String folderPath;
  String targetFilePath;
  // If no arguments are provided use default arguments
  if (args == null || args.isEmpty) {
    folderPath = _IMAGE_FOLDER;
    targetFilePath = _IMAGE_ASSET_GENERATION_PATH;
  } else {
    _validateArgs(args);
    folderPath = args[0];
    targetFilePath = args[1];
  }
  _generateImageAssetClass(folderPath, targetFilePath);
}

void _validateArgs(List<String> args) {
  if (args.length < 2) {
    throw Exception("Arguments not provided.\n"
        "First argument should be asset folder location.\n"
        "Second argument should be generated ImageAsset class's target location.");
  }

  final assetFolder = Directory(args[0]);

  if (!assetFolder.existsSync()) {
    throw Exception(
        "Asset folder ${assetFolder.path} doesn't exist. Provide a valid path!");
  }

  final imageAssetTargetFolder = Directory(args[1]);

  if (!imageAssetTargetFolder.existsSync()) {
    throw Exception(
        "ImageAsset target folder ${imageAssetTargetFolder.path} doesn't exist. Provide a valid path!");
  }
}

void _generateImageAssetClass(String imageFolder, String targetFolder) {
  _print("ImageAssetGenerator", "Reading all image files from $imageFolder");
  final assetFolder = Directory(imageFolder);
  final variables = assetFolder.listSync().map((fileEntry) {
    final assetFileName = basename(fileEntry.path);
    final variable = _convertFileNameToVariableName(assetFileName);
    return variable;
  }).toList();

  _print("ImageAssetGenerator", "Generating 'ImageAssets' class...");
  final imageAssetsClass = _getClassFromVariables(variables);

  _print("ImageAssetGenerator",
      "Writing to file ${targetFolder}/imageAssets.dart");
  _writeImageAssetsFile(imageAssetsClass, targetFolder);

  _print("ImageAssetGenerator",
      "Image assets file generated at ${targetFolder}/imageAssets.dart");
}

String _convertFileNameToVariableName(String fileName) {
  final fileNameWithoutExtension = fileName.split(".")[0];
  final upperCaseVariable = fileNameWithoutExtension.split("_").map((part) {
    return part.toUpperCase();
  }).join("_");
  return "static const $upperCaseVariable = 'assets/$fileName';";
}

String _getClassFromVariables(List<String> variables) {
  return """
class ImageAssets {
  ImageAssets._internal();

  ${variables.join("\n  ")}
}
  """;
}

void _writeImageAssetsFile(String imageAssetClass, String folderPath) {
  final file = File("${folderPath}/imageAssets.dart");
  file.writeAsStringSync(imageAssetClass);
}

void _print(String tag, String message, [bool extraLine = false]) {
  if (extraLine == true) {
    print("");
  }
  print("[${tag}]: $message");
}
