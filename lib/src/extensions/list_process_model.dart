import 'package:cpu_scheduler/src/process/process_model.dart';

extension SortingBasedOnArrivedTime on List<ProcessModel> {
  void sortingBasedOnArrivedTime() {
    sort((a, b) => a.arrivedTime.compareTo(b.arrivedTime));
  }
}

extension FindModelByName on List<ProcessModel> {
  ProcessModel findByName({required String name}) =>
      singleWhere((e) => e.name == name);
}
