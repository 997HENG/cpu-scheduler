import 'package:cpu_scheduler/process/process.dart';
import 'package:cpu_scheduler/process/process_model.dart';
import 'package:test/test.dart';

void main() {
  test(
    'constructor fromModel working',
    () => expect(
      Process.fromModel(model: ProcessModel.empty()),
      equals(
        Process(
          name: 'foo',
          arrivedTime: 0,
          cpuTime: 0,
          priority: 0,
        ),
      ),
    ),
  );
  test(
    'method runtime working',
    () => expect(
      Process.fromModel(model: ProcessModel.empty()),
      equals(
        Process(
          name: 'foo',
          arrivedTime: 0,
          cpuTime: 0,
          priority: 0,
        ),
      ),
    ),
  );
  test(
    'getProcessListFromModel working',
    () => expect(
      getProcessListFromModel(
        model: [
          ProcessModel.empty(),
          ProcessModel.empty(),
          ProcessModel.empty(),
          ProcessModel.empty(),
          ProcessModel.empty(),
        ],
      ),
      equals([
        Process(
          name: 'foo',
          arrivedTime: 0,
          cpuTime: 0,
          priority: 0,
        ),
        Process(
          name: 'foo',
          arrivedTime: 0,
          cpuTime: 0,
          priority: 0,
        ),
        Process(
          name: 'foo',
          arrivedTime: 0,
          cpuTime: 0,
          priority: 0,
        ),
        Process(
          name: 'foo',
          arrivedTime: 0,
          cpuTime: 0,
          priority: 0,
        ),
        Process(
          name: 'foo',
          arrivedTime: 0,
          cpuTime: 0,
          priority: 0,
        ),
      ]),
    ),
  );
}
