import 'package:cpu_scheduler/src/process/process_model.dart';

class ProcessTime {
  final String name;

  int waitting = 0;
  int response = 0;

  ProcessTime({required this.name});

  ProcessTime.fromModel({required ProcessModel model}) : name = model.name;

  void wait() => waitting += 1;

  set setWaitting(int n) {
    waitting = n;
  }

  set setResponse(int n) {
    response = n;
  }

  @override
  String toString() => 'name: $name, waitting: $waitting, response: $response';

  @override
  bool operator ==(covariant ProcessTime other) =>
      name == other.name &&
      waitting == other.waitting &&
      response == other.response;

  @override
  int get hashCode => Object.hash(waitting.hashCode, response.hashCode);
}
