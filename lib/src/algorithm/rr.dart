import 'package:cpu_scheduler/src/algorithm/algorithm.dart';
import 'package:cpu_scheduler/src/extensions/list_process.dart';
import 'package:cpu_scheduler/src/extensions/list_process_model.dart';
import 'package:cpu_scheduler/src/extensions/list_process_time.dart';
import 'package:cpu_scheduler/src/process/process.dart';
import 'package:cpu_scheduler/src/process/process_time.dart';

class Rr extends Algorithm {
  final int base;
  Rr({required super.model, int? time}) : base = time ?? 2;

  @override
  void compute() {
    bool round = false;
    int cnt = 0;

    while (done != model.length) {
      // for those unarrived
      if (onHandle < model.length) {
        if (model[onHandle].arrivedTime == total) {
          processes.add(Process.fromModel(model: model[onHandle]));
          handleTime.add(ProcessTime.fromModel(model: model[onHandle]));
          onHandle++;
        }
      }

      ///two conditions make it round
      ///#1 base time
      ///#2 a process done
      if (round && processes.isNotEmpty) {
        processes.roundRobin();
        round = false;
      }

      //processes has process
      if (processes.isNotEmpty) {
////////////////////////////////a round done/////////////////////////////////////////

        //process handling then cpuTime -1
        processes.first.runtime();
        gantt += '${processes.first.name}-';
        total++;
        cnt++;
        //make other process waitting
        handleTime.thenWaitting(onHandle: processes.first);
        // check where is a process done then return its name, otherwise not found
        doneProcess = processes.isDone();

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
          cnt = 0;
        }
        if (cnt == base && doneProcess == 'not found') {
          round = true;
          cnt = 0;
          gantt += '($total)-';
        }
      } else {
        total++;
      }
    }
    doneTime.sortByName();

    print('R.R. Algorithmn');
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
