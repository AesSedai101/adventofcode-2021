import 'day3.dart';
import 'day_template.dart';

void main(List<String> arguments) async {
  DayTemplate daySolution = Day3();

  print(daySolution.runtimeType);
  print(await daySolution.partOne());
  print(await daySolution.partTwo());
}
