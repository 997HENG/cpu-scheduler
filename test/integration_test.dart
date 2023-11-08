import 'package:cpu_scheduler/src/algorithm/fcfs.dart';
import 'package:cpu_scheduler/src/algorithm/priority.dart';
import 'package:cpu_scheduler/src/algorithm/rr.dart';
import 'package:cpu_scheduler/src/algorithm/srtf.dart';
import 'package:cpu_scheduler/src/extensions/list_process_model.dart';
import 'package:cpu_scheduler/src/process/process_input.dart';
import 'package:test/test.dart';

void main() {
  final models = input..sortingBasedOnArrivedTime();
  test(
    'fcfs working',
    () {
      final fcfs = Fcfs(model: models);
      fcfs.compute();
      expect(
        [
          fcfs.model.length,
          fcfs.processes.isEmpty,
          fcfs.handleTime.isEmpty,
          fcfs.doneTime.length,
          fcfs.total,
        ],
        equals(
          [
            5,
            true,
            true,
            5,
            22,
          ],
        ),
      );
    },
  );
  test(
    'srtf working',
    () {
      final srtf = Srtf(model: models);
      srtf.compute();
      expect(
        [
          srtf.model.length,
          srtf.processes.isEmpty,
          srtf.handleTime.isEmpty,
          srtf.doneTime.length,
          srtf.total,
        ],
        equals(
          [
            5,
            true,
            true,
            5,
            22,
          ],
        ),
      );
    },
  );
  test(
    'priority working',
    () {
      final priority = Priority(model: models);
      priority.compute();
      expect(
        [
          priority.model.length,
          priority.processes.isEmpty,
          priority.handleTime.isEmpty,
          priority.doneTime.length,
          priority.total,
        ],
        equals(
          [
            5,
            true,
            true,
            5,
            22,
          ],
        ),
      );
    },
  );
  test(
    'roundRobin working',
    () {
      final rr = Rr(model: models);
      rr.compute();
      expect(
        [
          rr.model.length,
          rr.processes.isEmpty,
          rr.handleTime.isEmpty,
          rr.doneTime.length,
          rr.total,
        ],
        equals(
          [
            5,
            true,
            true,
            5,
            22,
          ],
        ),
      );
    },
  );
}
