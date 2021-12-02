import 'day_template.dart';

class Day1 extends DayTemplate {
  @override
  Future<String> partOne() async {

    var list = await readFile('input/day1.txt').map((event) => int.parse(event)).toList();

    int count = 0;
    for (int i = 1; i < list.length; i++) {
      if (list[i] > list[i-1]) {
        count++;
      }
    }

    return count.toString();
  }

  @override
  Future<String> partTwo() async {
    var list = await readFile('input/day1.txt').map((event) => int.parse(event)).toList();

    // create the windows
    List<int> windows = List.empty(growable: true);

    for(int i=2; i< list.length; i++) {
      windows.add(list[i] + list[i-1] + list[i-2]);
    }

    int count = 0;
    for (int i = 1; i < windows.length; i++) {
      if (windows[i] > windows[i-1]) {
        count++;
      }
    }

    return count.toString();
  }
}