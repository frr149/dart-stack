import 'package:stack/stack.dart';
import 'package:test/test.dart';

void main() {
  late Stack<dynamic> stack;

  setUp(() {
    stack = Stack<dynamic>();
  });
  group('Creation', () {
    test('Empty Stack', () {
      expect(Stack<dynamic>(), isNotNull);
      expect(Stack<int>().isEmpty, isTrue);
      expect(Stack<String>().isNotEmpty, isFalse);
      expect(Stack<double?>().depth, 0);
    });
  });

  group('Push, pop & peek', () {
    test('when push, depth increases by 1', () {
      for (int i = 0; i < 20; i++) {
        expect(() => stack.push(i), returnsNormally);
        expect(stack.depth, i + 1);
      }
    });

    test('Peek shows the head, without changing the state of the stack', () {
      expect(stack.peek(), isNull);
      stack.push(42);
      expect(stack.peek(), 42);
    });

    test('when pop, depth decreases by 1', () {
      stack.push(42);
      expect(stack.pop(), 42);
      expect(stack.depth, 0);
    });

    test('when poped beyond 0, depth remains 0 and returns null', () {
      expect(stack.pop(), isNull);
      expect(stack.depth, 0);
    });
  });

  group('SizedStack: ', () {
    test('depth never > than max', () {
      final s = SizedStack<int>(maxDepth: 4);
      for (int i = 0; i < 25; i++) {
        s.push(i);
      }
      expect(s.depth <= 5, isTrue);
      expect(s.peek(), 24);
    });
  });
}
