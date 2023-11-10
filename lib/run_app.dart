import 'package:cpu_scheduler/src/algorithm/fcfs.dart';
import 'package:cpu_scheduler/src/algorithm/priority.dart';
import 'package:cpu_scheduler/src/algorithm/rr.dart';
import 'package:cpu_scheduler/src/algorithm/srtf.dart';
import 'package:cpu_scheduler/src/extensions/list_process_model.dart';

void run() {
  while (true) {
    try {
      final models = getProcessModelsList()..sortingBasedOnArrivedTime();
      Fcfs(model: models).compute();
      Srtf(model: models).compute();
      Priority(model: models).compute();
      Rr(model: models).compute();
      while (true) {}
    } catch (e) {
      print('\nPlease input right format in case of crashing\n');
    }
  }
}
