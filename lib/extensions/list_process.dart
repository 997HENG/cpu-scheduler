// import 'package:cpu_scheduler/process/process_time.dart';
// import '../process/process.dart';

// extension AllProcessesArrived on List<Process> {
//   List<ProcessTime> allProcessesArrived({required List<ProcessTime> time}) {
//     //the list of unhandle ProcessTime
//     final beforeTime = time;
//     final arrivedTimeList = map((e) => e.arrivedTime).toList();
//     final longestArrived = arrivedTimeList.last;

//     for (int n = 0, arrived = 0; n <= longestArrived && arrived != 5; n++) {
//       if (n == arrivedTimeList[arrived]) arrived++;
//     }
//   }
// }

import 'package:cpu_scheduler/process/process.dart';

//TODO untest
extension IsDone on List<Process> {
  String isDone() {
    final index = indexOf(singleWhere((e) => e.cpuTime == 0));
    if (index == -1) {
      return 'not found';
    }
    final name = this[index].name;
    removeAt(index);
    return name;
  }
}
