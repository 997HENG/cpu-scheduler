import 'dart:io' show stdin;
import 'package:cpu_scheduler/extensions/list_int.dart';

class Process {
  final String name;
  final int arrivedTime;
  final int cpuTime;
  final int priority;

  Process({
    required this.name,
    required this.arrivedTime,
    required this.cpuTime,
    required this.priority,
  });

  factory Process.empty() => Process(
        name: 'foo',
        arrivedTime: 0,
        cpuTime: 0,
        priority: 0,
      );

  @override
  String toString() {
    return ' ProcessName  = $name ';
  }

  @override
  bool operator ==(covariant Process other) =>
      name == other.name &&
      arrivedTime == other.arrivedTime &&
      cpuTime == other.cpuTime &&
      priority == other.priority;

  @override
  int get hashCode => Object.hash(
        name.hashCode,
        arrivedTime.hashCode,
        cpuTime.hashCode,
        priority.hashCode,
      );
}

typedef GetInput = String? Function();

///generating a list<Process> with 5 elements
///argument designed for testability
List<Process> getProcessList({
  GetInput? inputFn,
  String? getName,
  bool? hint,
}) {
  int cnt = 1;
  String name;
  GetInput getInput = (inputFn == null) ? () => stdin.readLineSync() : inputFn;
  final parameters = <int>[];
  final processes = <Process>[];

  while (cnt <= 5) {
    name = (getName == null) ? 'P$cnt' : getName;

    if (hint == null || hint == true) {
      print(
        'Please input process($name) arrivedTime(>=0), cpuTime(>0), priority(1-5): ',
      );
    }

    while (true) {
      String input = getInput()!;
      var number = int.tryParse(input);

      if (number != null) {
        parameters.add(number);
      } else {
        print('Wrong format!!');
      }

      if (parameters.length == 3) {
        break;
      }
    }
    final process = Process(
      name: name,
      arrivedTime: parameters[0],
      cpuTime: parameters[1],
      priority: parameters[2],
    );
    processes.add(process);
    cnt++;
    parameters.removeAll();
  }

  return processes;
}

extension SortingBasedOnArrivedTime on List<Process> {
  void sortingBasedOnArrivedTime() {
    sort((a, b) => a.arrivedTime.compareTo(b.arrivedTime));
  }
}
