import 'package:cpu_scheduler/algorithm/algorithm.dart';
import 'package:cpu_scheduler/model/process.dart';

class Fcfs extends Algorithm {
  Fcfs({required group}) : super(group: group);

  @override
  void compute() {
    group.sortingBasedOnArrivedTime();
  }

  @override
  void ganttDraw() {
    // TODO: implement ganttDraw
  }

  @override
  void groupToString() {
    // TODO: implement groupToString
  }
}
