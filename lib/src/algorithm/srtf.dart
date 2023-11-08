import 'package:cpu_scheduler/src/algorithm/algorithm.dart';
import 'package:cpu_scheduler/src/extensions/list_process.dart';
import 'package:cpu_scheduler/src/extensions/list_process_model.dart';
import 'package:cpu_scheduler/src/extensions/list_process_time.dart';
import 'package:cpu_scheduler/src/process/process.dart';
import 'package:cpu_scheduler/src/process/process_time.dart';

class Srtf extends Algorithm {
  Srtf({required super.model});

  @override
  void compute() {
    String lastProcess = '';
    String currentProcess = '';
    bool changed = false;

    while (done != model.length) {
      // for those unarrived
      if (onHandle < model.length) {
        if (model[onHandle].arrivedTime == total) {
          processes.add(Process.fromModel(model: model[onHandle]));
          handleTime.add(ProcessTime.fromModel(model: model[onHandle]));
          onHandle++;
        }
      }

      //processes has process
      if (processes.isNotEmpty) {
        //last round`s state
        lastProcess = processes.first.name;
        processes.sortByRemaining();
        currentProcess = processes.first.name;
        changed = lastProcess != currentProcess;
        //handling process changed and undone
        if (changed && doneProcess == 'not found') {
          gantt += '($total)-';
          changed = false;
        }

////////////////////////////////a round done/////////////////////////////////////////

        //process handling then cpuTime -1
        processes.first.runtime();
        gantt += '$currentProcess-';
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

    print('SRTF Algorithmn');
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
