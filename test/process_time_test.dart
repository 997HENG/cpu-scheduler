import 'package:cpu_scheduler/process/process_model.dart';
import 'package:cpu_scheduler/process/process_time.dart';
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
    'fromModel constructor working',
    () => expect(
      ProcessTime.fromModel(model: ProcessModel.empty()),
      equals(ProcessTime(name: 'foo')),
    ),
  );
  test('getProcessTimeListFromModel', () {
    final list = getProcessTimeListFromModel(
      model: [
        ProcessModel.empty(),
        ProcessModel.empty(),
        ProcessModel.empty(),
        ProcessModel.empty(),
        ProcessModel.empty(),
      ],
    );
    expect(
      list,
      equals(
        [
          ProcessTime(name: 'foo'),
          ProcessTime(name: 'foo'),
          ProcessTime(name: 'foo'),
          ProcessTime(name: 'foo'),
          ProcessTime(name: 'foo'),
        ],
      ),
    );
  });
}
