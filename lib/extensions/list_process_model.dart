import 'package:cpu_scheduler/process/process_model.dart';

// extension SortingBasedOnArrivedTime on List<ProcessModel> {
//   List<ProcessModel> sortingBasedOnArrivedTime() {
//     sort((a, b) => a.arrivedTime.compareTo(b.arrivedTime));
//     return this;
//   }
// }

extension SortingBasedOnArrivedTime on List<ProcessModel> {
  void sortingBasedOnArrivedTime() {
    sort((a, b) => a.arrivedTime.compareTo(b.arrivedTime));
  }
}

//TODO unTested
extension FindModelByName on List<ProcessModel> {
  ProcessModel findByName({required String name}) =>
      singleWhere((e) => e.name == name);
}
