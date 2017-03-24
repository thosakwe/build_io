import 'dart:async';
import 'dart:io';
import 'package:build/build.dart';

class CopyBuilder implements Builder {
  final Directory outputDirectory;

  CopyBuilder(this.outputDirectory);

  @override
  List<AssetId> declareOutputs(AssetId inputId) {
    return [inputId.changeExtension('fake.dart')];
  }

  @override
  Future build(BuildStep buildStep) async {
    var file =
        new File.fromUri(outputDirectory.uri.resolve(buildStep.inputId.path));
    if (!await file.exists()) await file.create(recursive: true);
    file.openWrite()
      ..add(await file.readAsBytes())
      ..close();
  }
}
