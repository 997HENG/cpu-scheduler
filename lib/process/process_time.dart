import 'package:cpu_scheduler/process/process_model.dart';

class ProcessTime {
  final String name;

  int waitting = 0;
  int response = 0;

  ProcessTime({required this.name});
  set setResponse(int n) {
    response = n;
  }

  ProcessTime.fromModel({required ProcessModel model}) : name = model.name;

  void wait() => waitting += 1;

  set setWaitting(int n) {
    waitting = n;
  }

  @override
  bool operator ==(covariant ProcessTime other) =>
      waitting == other.waitting && response == other.response;

  @override
  int get hashCode => Object.hash(waitting.hashCode, response.hashCode);
}

List<ProcessTime> getProcessTimeListFromModel({
  required List<ProcessModel> model,
}) =>
    model.map((e) => ProcessTime(name: e.name)).toList();
