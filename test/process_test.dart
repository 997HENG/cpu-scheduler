import 'package:cpu_scheduler/model/process.dart';
import 'package:test/test.dart';

void main() {
  test('Object equality', () {
    expect(
      Process.empty(),
      equals(
        Process(
          name: 'foo',
          arrivedTime: 0,
          cpuTime: 0,
          priority: 0,
        ),
      ),
    );
  });

  test('getProcessList working', () {
    expect(
      getProcessList(
        inputFn: () => '0',
        getName: 'foo',
        hint: false,
      ),
      equals(<Process>[
        Process.empty(),
        Process.empty(),
        Process.empty(),
        Process.empty(),
        Process.empty(),
      ]),
    );
  });
  test('Sorting by arrivedTime', () {
    final list = [
      Process(
        name: 'foo',
        arrivedTime: 1,
        cpuTime: 0,
        priority: 0,
      ),
      Process(
        name: 'foo',
        arrivedTime: 2,
        cpuTime: 0,
        priority: 0,
      ),
      Process(
        name: 'foo',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 0,
      ),
    ]..sortingBasedOnArrivedTime();

    expect(
      list,
      equals(
        <Process>[
          Process(
            name: 'foo',
            arrivedTime: 0,
            cpuTime: 0,
            priority: 0,
          ),
          Process(
            name: 'foo',
            arrivedTime: 1,
            cpuTime: 0,
            priority: 0,
          ),
          Process(
            name: 'foo',
            arrivedTime: 2,
            cpuTime: 0,
            priority: 0,
          ),
        ],
      ),
    );
  });
}
