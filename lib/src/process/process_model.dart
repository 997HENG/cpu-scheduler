import 'dart:io' show stdin;

//@immutable
//the reference for each algorithm`s process
class ProcessModel {
  final String name;
  final int arrivedTime;
  final int cpuTime;
  final int priority;

  ProcessModel({
    required this.name,
    required this.arrivedTime,
    required this.cpuTime,
    required this.priority,
  });

  factory ProcessModel.empty() => ProcessModel(
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
  bool operator ==(covariant ProcessModel other) =>
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

///generating a list<ProcessModel> with 5 elements
///argument designed for testability
List<ProcessModel> getProcessModelsList({
  int? count,
  GetInput? inputFn,
  String? getName,
  bool? hint,
}) {
  print('Please input process`s count');
  count = count ?? int.tryParse(stdin.readLineSync()!)!;
  int cnt = 1;
  String name;
  late String input;
  GetInput getInput = (inputFn == null) ? () => stdin.readLineSync() : inputFn;
  final parameters = <int>[];
  final processes = <ProcessModel>[];

  while (cnt <= count) {
    name = (getName == null) ? 'P$cnt' : getName;

    if (hint == null || hint == true) {
      print(
        'Please input process($name) cpuTime(>0), arrivedTime(>=0),  priority(1-5)',
      );
    }
    input = getInput()!;
    var list = input.split(RegExp(r',\s*'));

    for (var element in list) {
      var number = int.tryParse(element);

      if (number != null) {
        parameters.add(number);
      }

      if (parameters.length == 3) {
        break;
      }
    }

    final process = ProcessModel(
      name: name,
      cpuTime: parameters[0],
      arrivedTime: parameters[1],
      priority: parameters[2],
    );
    processes.add(process);
    cnt++;
    parameters.clear();
  }
  print('\n');
  return processes;
}
