import 'package:cpu_scheduler/process/process.dart';
import 'package:cpu_scheduler/process/process_time.dart';

extension GetAverageTime on List<ProcessTime> {
  double getAverageTime() =>
      map((e) => e.waitting)
          .toList()
          .reduce((value, element) => value + element) /
      5;
}

//TODO unTested
extension RunTime on List<ProcessTime> {
  void runTime({required Process onHandle}) {
    final name = onHandle.name;
    int ignore = indexOf(singleWhere((e) => e.name == name));
    for (int i = 0; i < length; i++) {
      if (i == ignore) {
        continue;
      }
      this[i].wait();
    }
  }
}

//TODO unTested
extension FindProcessTimeByName on List<ProcessTime> {
  ProcessTime findByName({required String name}) =>
      singleWhere((e) => e.name == name);
}

//TODO unTested
extension RemoveByName on List<ProcessTime> {
  void removeByName({required String name}) =>
      remove(singleWhere((e) => e.name == name));
}
