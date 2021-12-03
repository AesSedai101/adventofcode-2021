import 'day_template.dart';

class Day3 extends DayTemplate {
  @override
  Future<String> partOne() async {
    List<String> inputList = await readFile('input/day3.txt').toList();

    var size = inputList[0].length;

    String gamma = "";
    String epsilon = "";

    for(int i = 0; i < size; i++) {
      int zeros = inputList.map((e) => e[i]).where((element) => element == '0').length;
      int ones = inputList.map((e) => e[i]).where((element) => element == '1').length;

      if (zeros > ones) {
        gamma = "${gamma}0";
        epsilon = "${epsilon}1";
      } else {
        gamma = "${gamma}1";
        epsilon = "${epsilon}0";
      }
    }

    return "${_binaryToBase10(gamma) * _binaryToBase10(epsilon)}";
  }

  @override
  Future<String> partTwo() async {
    List<String> inputList = await readFile('input/day3.txt').toList();

    var size = inputList[0].length;

    List<String> o2 = inputList.toList();
    List<String> co2 = inputList.toList();

    for(int i=0; i< size; i++) {
      if (o2.length > 1) {
        int zeros = o2.map((e) => e[i]).where((element) => element == '0').length;
        int ones = o2.map((e) => e[i]).where((element) => element == '1').length;

        if (ones >= zeros) {
          o2 = o2.where((element) => element[i] == "1").toList();
        } else {
          o2 = o2.where((element) => element[i] == "0").toList();
        }
      }

      if (co2.length > 1) {
        int zeros = co2.map((e) => e[i]).where((element) => element == '0').length;
        int ones = co2.map((e) => e[i]).where((element) => element == '1').length;

        if (zeros <= ones) {
          co2 = co2.where((element) => element[i] == "0").toList();
        } else {
          co2 = co2.where((element) => element[i] == "1").toList();
        }
      }
    }

    return "${_binaryToBase10(o2[0]) * _binaryToBase10(co2[0])}";
  }

  static int _binaryToBase10(String binaryString) {
    int val = 0;
    for (int i=0; i<binaryString.length; i++) {
      val <<=1;
      val += int.parse(binaryString[i]);
    }
    return val;
  }
}