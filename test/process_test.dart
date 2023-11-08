import 'package:cpu_scheduler/src/extensions/list_process.dart';
import 'package:cpu_scheduler/src/process/process.dart';
import 'package:cpu_scheduler/src/process/process_model.dart';
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
  test('method runtime working', () {
    final process1 = Process(
      name: 'foo',
      arrivedTime: 0,
      cpuTime: 5,
      priority: 0,
    )..runtime();
    final process2 = Process(
      name: 'foo',
      arrivedTime: 0,
      cpuTime: 5,
      priority: 0,
    )..runtime(time: 4);

    expect(
      [
        process1.cnt,
        process2.cnt,
      ],
      [4, 1],
    );
  });
  test('extension isdone working', () {
    final list = [Process.fromModel(model: ProcessModel.empty())];
    final found = list.isDone();
    final notFound = list.isDone();
    expect(
      [
        found,
        list.isEmpty,
        notFound,
      ],
      [
        'foo',
        true,
        'not found',
      ],
    );
  });
  test('extension sortByRemaining working', () {
    final list = [
      Process(
        name: 'foo',
        arrivedTime: 0,
        cpuTime: 35,
        priority: 0,
      ),
      Process(
        name: 'bar',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 0,
      ),
      Process(
        name: 'baz',
        arrivedTime: 0,
        cpuTime: 20,
        priority: 0,
      ),
    ]..sortByRemaining();
    expect(
      list,
      equals(
        [
          Process(
            name: 'bar',
            arrivedTime: 0,
            cpuTime: 0,
            priority: 0,
          ),
          Process(
            name: 'baz',
            arrivedTime: 0,
            cpuTime: 20,
            priority: 0,
          ),
          Process(
            name: 'foo',
            arrivedTime: 0,
            cpuTime: 35,
            priority: 0,
          ),
        ],
      ),
    );
  });
  test('extension sortByPriority working', () {
    final list = [
      Process(
        name: 'foo',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 3,
      ),
      Process(
        name: 'bar',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 1,
      ),
      Process(
        name: 'baz',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 2,
      ),
    ]..sortByPriority();
    expect(
      list,
      equals(
        [
          Process(
            name: 'bar',
            arrivedTime: 0,
            cpuTime: 0,
            priority: 1,
          ),
          Process(
            name: 'baz',
            arrivedTime: 0,
            cpuTime: 0,
            priority: 2,
          ),
          Process(
            name: 'foo',
            arrivedTime: 0,
            cpuTime: 0,
            priority: 3,
          ),
        ],
      ),
    );
  });
  test('extension RR working', () {
    final list = [
      Process(
        name: 'foo',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 0,
      ),
      Process(
        name: 'bar',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 0,
      ),
      Process(
        name: 'baz',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 0,
      ),
    ]..roundRobin();
    expect(
      list,
      equals(
        [
          Process(
            name: 'bar',
            arrivedTime: 0,
            cpuTime: 0,
            priority: 0,
          ),
          Process(
            name: 'baz',
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
        ],
      ),
    );
  });
}
