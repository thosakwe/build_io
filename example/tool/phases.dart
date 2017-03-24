import 'dart:io';
import 'package:build_io/build_io.dart';
import 'package:build_runner/build_runner.dart';
import 'package:check_for_update/builder.dart';

final PhaseGroup phaseGroup = new PhaseGroup()
  ..addPhase(new Phase()
    ..addAction(new CheckForUpdateBuilder(packageName: 'angel_cli'),
        new InputSet('example', const ['pubspec.yaml']))
    ..addAction(new CopyBuilder(new Directory('lib')),
        new InputSet('example', const ['pubspec.update.g.dart'])));
