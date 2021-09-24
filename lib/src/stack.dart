class Stack<Element> {
  final List<Element> _elts = [];

  // Accessors
  bool get isEmpty => _elts.isEmpty;
  bool get isNotEmpty => !isEmpty;

  int get depth => _elts.length;

  // Returns the head, without removing it.
  // If the stack is empty, will return null
  Element? peek() {
    Element? head;

    try {
      head = _elts.first;
    } on StateError {
      head = null;
    } catch (e) {
      rethrow;
    }

    return head;
  }

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

class SizedStack<Element> extends Stack<Element> {
  late final int _maxDepth;

  SizedStack({int maxDepth = 100}) : _maxDepth = maxDepth;

  @override
  int push(Element elt) {
    if (depth >= _maxDepth) {
      _elts.removeLast();
    }
    return super.push(elt);
  }
}
