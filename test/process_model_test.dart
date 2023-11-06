import 'package:cpu_scheduler/extensions/list_process_model.dart';
import 'package:cpu_scheduler/process/process_model.dart';
import 'package:test/test.dart';

void main() {
  test('Object equality', () {
    expect(
      ProcessModel.empty(),
      equals(
        ProcessModel(
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
      getProcessesList(
        inputFn: () => '0',
        getName: 'foo',
        hint: false,
      ),
      equals(<ProcessModel>[
        ProcessModel.empty(),
        ProcessModel.empty(),
        ProcessModel.empty(),
        ProcessModel.empty(),
        ProcessModel.empty(),
      ]),
    );
  });
  test('Sorting by arrivedTime', () {
    final list = [
      ProcessModel(
        name: 'foo',
        arrivedTime: 1,
        cpuTime: 0,
        priority: 0,
      ),
      ProcessModel(
        name: 'foo',
        arrivedTime: 2,
        cpuTime: 0,
        priority: 0,
      ),
      ProcessModel(
        name: 'foo',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 0,
      ),
    ];
    list.sortingBasedOnArrivedTime();

    expect(
      list,
      equals(
        <ProcessModel>[
          ProcessModel(
            name: 'foo',
            arrivedTime: 0,
            cpuTime: 0,
            priority: 0,
          ),
          ProcessModel(
            name: 'foo',
            arrivedTime: 1,
            cpuTime: 0,
            priority: 0,
          ),
          ProcessModel(
            name: 'foo',
            arrivedTime: 2,
            cpuTime: 0,
            priority: 0,
          ),
        ],
      ),
    );
  });

  test('findByName working', () {
    final item = [
      ProcessModel(
        name: 'foo',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 0,
      ),
      ProcessModel(
        name: 'bar',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 0,
      ),
    ].findByName(name: 'bar');
    expect(
      item,
      ProcessModel(
        name: 'bar',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 0,
      ),
    );
  });
}
