import 'package:cpu_scheduler/src/extensions/list_process_time.dart';
import 'package:cpu_scheduler/src/process/process.dart';
import 'package:cpu_scheduler/src/process/process_model.dart';
import 'package:cpu_scheduler/src/process/process_time.dart';
import 'package:test/test.dart';

void main() {
  test('setter working', () {
    final processTime = ProcessTime(name: 'foo');
    processTime.setResponse = 10;
    processTime.setWaitting = 15;
    expect(
      [
        processTime.response,
        processTime.waitting,
      ],
      equals([10, 15]),
    );
  });
  test('method wait working', () {
    final time = ProcessTime(name: 'foo');
    time.wait();
    expect(time.waitting, equals(1));
  });
  test(
    'constructor fromModel working',
    () => expect(
      ProcessTime.fromModel(model: ProcessModel.empty()),
      equals(ProcessTime(name: 'foo')),
    ),
  );
  test(
    'extension findProcessTimeFromName working',
    () => expect(
      [
        ProcessTime.fromModel(model: ProcessModel.empty()),
        ProcessTime(name: 'bar'),
      ].findByName(name: 'foo'),
      equals(ProcessTime(name: 'foo')),
    ),
  );

  test(
    'extension removeByName working',
    () => expect(
      [
        ProcessTime.fromModel(model: ProcessModel.empty()),
        ProcessTime(name: 'bar'),
      ]..removeByName(name: 'foo'),
      equals(
        [
          ProcessTime(name: 'bar'),
        ],
      ),
    ),
  );
  test(
    'extension runTime working',
    () => expect(
      [
        ProcessTime(name: 'foo'),
        ProcessTime(name: 'bar'),
        ProcessTime(name: 'baz'),
      ]..thenWaitting(
          onHandle: Process.fromModel(model: ProcessModel.empty()),
        ),
      equals(
        [
          ProcessTime(name: 'foo'),
          ProcessTime(name: 'bar')..wait(),
          ProcessTime(name: 'baz')..wait(),
        ],
      ),
    ),
  );
  test('extension getAllTime working', () {
    final time = [
      ProcessTime(name: 'foo'),
      ProcessTime(name: 'foo'),
      ProcessTime(name: 'foo'),
    ];
    for (var element in time) {
      element.setWaitting = 50;
    }
    expect(time.getAllTime(), 150);
  });
  test(
    'extension sortByName working',
    () => expect(
      [
        ProcessTime(name: 'p3'),
        ProcessTime(name: 'p1'),
        ProcessTime(name: 'p2'),
      ]..sortByName(),
      equals([
        ProcessTime(name: 'p1'),
        ProcessTime(name: 'p2'),
        ProcessTime(name: 'p3'),
      ]),
    ),
  );
}
