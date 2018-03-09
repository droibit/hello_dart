import 'package:hello_lib/hello_lib.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    AwesomeLibrary awesome;

    setUp(() {
      awesome = new AwesomeLibrary();
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
