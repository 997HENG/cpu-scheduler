import 'package:cpu_scheduler/model/process_time.dart';
import 'package:test/test.dart';

void main() {
  test('setter working', () {
    final processTime = ProcessTime()..setResponse = 10;
    expect(
      processTime.reponse,
      equals(10),
    );
  });
  test('getProcessTimeList working', () {
    expect(
      getProcessTimeList(),
      <ProcessTime>[
        ProcessTime(),
        ProcessTime(),
        ProcessTime(),
        ProcessTime(),
        ProcessTime(),
      ],
    );
  });
}
