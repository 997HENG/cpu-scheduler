import 'package:cpu_scheduler/algorithm/algorithm.dart';
import 'package:cpu_scheduler/extensions/list_process.dart';
import 'package:cpu_scheduler/extensions/list_process_model.dart';
import 'package:cpu_scheduler/extensions/list_process_time.dart';
import 'package:cpu_scheduler/process/process.dart';
import 'package:cpu_scheduler/process/process_time.dart';

class Fcfs extends Algorithm {
  Fcfs({required super.model});

  @override
  void compute() {
    int done = 0;
    String doneProcess;

    while (done != model.length) {
      // for those unarrived
      int onHandle = 0;
      if (model[onHandle].arrivedTime == total) {
        processes.add(Process.fromModel(model: model[onHandle]));
        handleTime.add(ProcessTime.fromModel(model: model[onHandle]));
        onHandle++;
      }
      //process handling then cpuTime -1
      processes.first.runtime();
      gantt += '|${processes.first.name}|-';
      //make other process waitting
      handleTime.runTime(onHandle: processes.first);
      doneProcess = processes.isDone();

      //a process is done and removed
      if (doneProcess != 'not found') {
        done++;
        final time = doneTime.findByName(name: doneProcess);
        doneTime.add(time);
        handleTime.removeByName(name: doneProcess);
        time.setResponse = total -
            time.waitting -
            model.findByName(name: doneProcess).getCpuAndArrived();
      }
      print('FCFS Algorithmn');
      print(gantt);
    }
  }
}
