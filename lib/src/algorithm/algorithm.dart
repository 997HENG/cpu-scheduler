import 'package:cpu_scheduler/src/process/process.dart';
import 'package:cpu_scheduler/src/process/process_model.dart';
import 'package:cpu_scheduler/src/process/process_time.dart';

class Algorithm {
  //this model need to sort first based on arrived time
  final List<ProcessModel> model;
  final processes = <Process>[];
  final handleTime = <ProcessTime>[];
  final doneTime = <ProcessTime>[];
  late final double averageWaittingTime;
  int total = 0;
  int done = 0;
  int onHandle = 0;
  String doneProcess = 'not found';
  String gantt = '-0-';

  Algorithm({required this.model});

  //for every algorithm
  void compute() {}
}
