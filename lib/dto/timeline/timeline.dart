import 'package:neev123dev/dto/timeline/cases.dart';
import 'package:neev123dev/dto/timeline/deaths.dart';
import 'package:neev123dev/dto/timeline/recovered.dart';

class Timeline {
  Cases cases;
  Deaths deaths;
  Recovered recovered;

  Timeline.fromJsonMap(Map<String, dynamic> map)
      : cases = Cases.fromJsonMap(map["cases"]),
        deaths = Deaths.fromJsonMap(map["deaths"]),
        recovered = Recovered.fromJsonMap(map["recovered"]);
}