import 'package:cpu_scheduler/src/process/process.dart';

extension IsDone on List<Process> {
  String isDone() {
    try {
      final index = indexOf(singleWhere((e) => e.cnt == 0));
      final name = this[index].name;
      removeAt(index);
      return name;
    } catch (e) {
      return 'not found';
    }
  }
}

extension SortingByRemainingTime on List<Process> {
  void sortByRemaining() => sort((a, b) => a.cnt.compareTo(b.cnt));
}

extension SortingByPriority on List<Process> {
  void sortByPriority() => sort((a, b) => a.priority.compareTo(b.priority));
}

extension RoundRobin on List<Process> {
  void roundRobin() {
    final process = first;
    removeAt(0);
    add(process);
  }
}
