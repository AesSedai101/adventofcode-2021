import 'day_template.dart';

class Day0 extends DayTemplate {
  @override
  Future<String> partOne() async {
    return readFile('input/day0.txt').length.then((value) => value.toString());
  }

  @override
  Future<String> partTwo() async {
    return readFile('input/day0.txt').toList().then((value) => value.join(", "));
  }
}