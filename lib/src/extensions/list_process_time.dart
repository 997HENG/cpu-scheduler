import 'package:cpu_scheduler/src/process/process.dart';
import 'package:cpu_scheduler/src/process/process_time.dart';

extension FindProcessTimeByName on List<ProcessTime> {
  ProcessTime findByName({required String name}) =>
      singleWhere((e) => e.name == name);
}

extension RemoveByName on List<ProcessTime> {
  void removeByName({required String name}) =>
      remove(singleWhere((e) => e.name == name));
}

extension RunTime on List<ProcessTime> {
  void thenWaitting({required Process onHandle}) {
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

extension GetAllTime on List<ProcessTime> {
  int getAllTime() =>
      map((e) => e.waitting).reduce((value, element) => value + element);
}

extension SortingByName on List<ProcessTime> {
  void sortByName() => sort((a, b) => a.name.compareTo(b.name));
}
