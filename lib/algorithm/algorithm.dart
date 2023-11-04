import 'package:cpu_scheduler/model/process.dart';
import 'package:cpu_scheduler/model/process_time.dart';

class Algorithm {
  final List<Process> group;
  late final int averageWaitting;
  late final String gantt;
  final List<ProcessTime> time;

  Algorithm({
    required this.group,
  }) : time = getProcessTimeList();
  void compute() {}
  void ganttDraw() {}
  void groupToString() {}
}
