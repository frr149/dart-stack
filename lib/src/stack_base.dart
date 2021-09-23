class Stack<Element> {
  final List<Element> _elts = [];

  // Accessors
  bool get isEmpty => _elts.isEmpty;
  bool get isNotEmpty => !isEmpty;

  int get depth => _elts.length;

  // Mutators

  /// Pushes the new element, and returns the new depth
  int push(Element elt) {
    _elts.insert(0, elt);
    return depth;
  }

  /// Returns the head? or null
  Element? pop() {
    Element? head;
    if (_elts.isNotEmpty) {
      head = _elts[0];
      _elts.removeAt(0);
    }
    return head;
  }
}
