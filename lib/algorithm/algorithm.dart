import 'package:cpu_scheduler/process/process.dart';
import 'package:cpu_scheduler/process/process_model.dart';
import 'package:cpu_scheduler/process/process_time.dart';

class Algorithm {
  //this model need to sort first based on arrived time
  final List<ProcessModel> model;
  final processes = <Process>[];
  final handleTime = <ProcessTime>[];
  final doneTime = <ProcessTime>[];
  int total = 0;
  final int longest;
  String gantt = '';

  Algorithm({required this.model}) : longest = model.last.arrivedTime;

  //for every algorithm
  void compute() {}
}
