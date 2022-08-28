class WidgetNotFOundException<T> implements Exception {
  @override
  String toString() {
    return 'This class does not have this state: $T';
  }
}
