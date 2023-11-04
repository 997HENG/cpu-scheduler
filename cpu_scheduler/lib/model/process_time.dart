class ProcessTime {
  int waitting = 0;
  int reponse = 0;
  set setResponse(int response) {
    reponse = response;
  }

  set setWaitting(int waitting) {
    waitting = waitting;
  }

  @override
  bool operator ==(covariant ProcessTime other) =>
      waitting == other.waitting && reponse == other.reponse;

  @override
  int get hashCode => Object.hash(waitting.hashCode, reponse.hashCode);
}

List<ProcessTime> getProcessTimeList() {
  return <ProcessTime>[
    ProcessTime(),
    ProcessTime(),
    ProcessTime(),
    ProcessTime(),
    ProcessTime(),
  ];
}
