import 'package:cpu_scheduler/src/process/process_model.dart';

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

  void runtime({int? time}) => cnt -= (time ?? 1);

  @override
  bool operator ==(covariant Process other) =>
      name == other.name &&
      arrivedTime == other.arrivedTime &&
      cpuTime == other.cpuTime &&
      priority == other.priority;

  @override
  int get hashCode => Object.hash(
        name,
        arrivedTime,
        cpuTime,
        priority,
      );
}
