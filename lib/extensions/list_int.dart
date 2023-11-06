/// == clear()
extension RemoveAll on List<int> {
  void removeAll() {
    while (isNotEmpty) {
      removeLast();
    }
  }
}
