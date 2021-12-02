import 'day2.dart';
import 'day_template.dart';

void main(List<String> arguments) async {
  DayTemplate daySolution = Day2();

  print(daySolution.runtimeType);
  print(await daySolution.partOne());
  print(await daySolution.partTwo());
}
