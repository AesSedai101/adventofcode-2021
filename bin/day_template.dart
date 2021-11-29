import 'dart:convert';
import 'dart:io';

abstract class DayTemplate {
  Stream<String> readFile(String file) {
    return File(file).openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter());
  }

  Future<String> partOne();
  Future<String> partTwo();
}