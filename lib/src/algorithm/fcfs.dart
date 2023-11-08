import 'package:cpu_scheduler/src/algorithm/algorithm.dart';
import 'package:cpu_scheduler/src/extensions/list_process.dart';
import 'package:cpu_scheduler/src/extensions/list_process_model.dart';
import 'package:cpu_scheduler/src/extensions/list_process_time.dart';
import 'package:cpu_scheduler/src/process/process.dart';
import 'package:cpu_scheduler/src/process/process_time.dart';

class Fcfs extends Algorithm {
  Fcfs({required super.model});

  @override
  void compute() {
    while (done != model.length) {
      // for those unarrived
      if (onHandle < model.length) {
        if (model[onHandle].arrivedTime == total) {
          processes.add(Process.fromModel(model: model[onHandle]));
          handleTime.add(ProcessTime.fromModel(model: model[onHandle]));
          onHandle++;
        }
      }
      if (processes.isNotEmpty) {
        //process handling then cpuTime -1
        processes.first.runtime();
        gantt += '${processes.first.name}-';
        //make other process waitting
        handleTime.thenWaitting(onHandle: processes.first);
        // check where is a process done then return its name, otherwise not found
        doneProcess = processes.isDone();
        total++;

        // handling process changed but no process done

        //a process is done and removed
        if (doneProcess != 'not found') {
          done++;
          // a process done then add time
          gantt += '($total)-';
          final time = handleTime.findByName(name: doneProcess);
          doneTime.add(time);
          handleTime.removeByName(name: doneProcess);
          time.setResponse =
              total - model.findByName(name: doneProcess).arrivedTime;
        }
      } else {
        total++;
      }
    }
    doneTime.sortByName();

    print('FCFS Algorithmn');
    print(gantt);
    averageWaittingTime = doneTime.getAllTime() / doneTime.length;
    for (var element in doneTime) {
      print(element);
    }
    print(
      'average waitting time: $averageWaittingTime\n\n',
    );
  }
}
