import 'package:cpu_scheduler/process/process_model.dart';

// the diffirence between model and this is computable and for each alogrithm to use
class Process extends ProcessModel {
  int cnt;
  Process({
    required super.name,
    required super.arrivedTime,
    required super.cpuTime,
    required super.priority,
  }) : cnt = cpuTime;

  Process.fromModel({
    required ProcessModel model,
  })  : cnt = model.cpuTime,
        super(
          name: model.name,
          arrivedTime: model.arrivedTime,
          cpuTime: model.cpuTime,
          priority: model.priority,
        );

  void runtime() => cnt -= 1;
}

List<Process> getProcessListFromModel({required List<ProcessModel> model}) =>
    model.map((e) => Process.fromModel(model: e)).toList();
