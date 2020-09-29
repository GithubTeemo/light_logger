import 'dart:convert';
import 'dart:io';

import 'base.dart';
import 'iosink_handler.dart';

import '../utils.dart';

/// Open and close files every time you print
/// want fast, please use [IOSinkLoggerHandler]
class FileLoggerHandler extends LoggerHandler {
  final File file;
  final LoggerLevel level;

  FileLoggerHandler(this.file, {this.level})
      : assert(file != null),
        super(level: level);

  @override
  void resolve(LoggerLevel level, exception) async {
    final File f = file;
    if (!await f.exists()) {
      await f._createFileAndParent();
    }
    f.write('${level.name}: ${stringify(exception)}\n',
        mode: FileMode.writeOnlyAppend);
  }
}

extension FileExtension on File {
  Future<bool> _createFileAndParent() async {
    Directory parent = this.parent;
    var parentExist = await parent.exists();
    if (!parentExist) {
      await parent.create();
    }
    if (!await parent.exists()) {
      return false;
    }
    if (!(await this.exists())) {
      await this.create();
    }
    return await this.exists();
  }

  write(String contents,
      {FileMode mode: FileMode.write,
      Encoding encoding: utf8,
      bool flush = false}) {
    IOSink sink;
    try {
      sink = this.openWrite(mode: mode, encoding: encoding);
      sink.write(contents);
      if (flush) {
        sink.flush();
      }
    } finally {
      sink?.close();
    }
  }
}
