import 'dart:async';
import 'day_template.dart';

class Day2 extends DayTemplate {
  @override
  Future<String> partOne() async {

    return readFile('input/day2.txt').map((event) => _mapInput(event, true))
        .reduce((previous, element) => Change(previous.depth + element.depth, previous.horizontal + element.horizontal, 0, ""))
        .then((value) => value.depth * value.horizontal)
        .then((value) => value.toString());
  }

  @override
  Future<String> partTwo() async {
    List<Change> changeList = List.from([Change(0, 0, 0, "start")]);
    changeList.addAll(await readFile('input/day2.txt').map((event) => _mapInput(event, false)).toList());

    return Stream.fromIterable(changeList)
        .reduce((previous, element) => _calcChange(previous, element))
        .then((value) => value.depth * value.horizontal)
        .then((value) => value.toString());
  }

  Change _mapInput(String event, bool first) {
    int horizontal = 0;
    int depth = 0;
    int aim = 0;

    var change = int.parse(event.split(" ")[1]);

    if (event.contains("forward")) {
      horizontal += change;
      aim = change;
    }
    if (event.contains("down")) {
      if (first) {
        depth += change;
      } else {
        aim += change;
      }
    }
    if (event.contains("up")) {
      if (first ) {
        depth -= change;
      } else {
        aim -= change;
      }
    }

    return Change(depth, horizontal, aim, event);
  }

  Change _calcChange(Change previous, Change element) {
    Change change;
    if (element.horizontal == 0) {
      change = Change(previous.depth + element.depth, previous.horizontal + element.horizontal, previous.aim + element.aim, "");
    } else {
      //It increases your depth by your aim multiplied by X.
      change = Change(previous.depth + previous.aim * element.aim, previous.horizontal + element.horizontal, previous.aim, "");
    }
    //print('Combining $previous and $element -> $change');
    return change;
  }

}

class Change {
  final int depth;
  final int horizontal;
  final int aim;
  final String description;

  Change(this.depth, this.horizontal, this.aim, this.description);

  @override
  String toString() {
    return 'Change{depth: $depth, horizontal: $horizontal, aim: $aim, description: $description}';
  }
}