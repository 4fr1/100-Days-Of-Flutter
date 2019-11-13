import 'package:test/test.dart';

void main() {

  group('List Test', () {

    test('Should add item to list', () {
      List<String> names = List();
      names.add("Lukas");

      expect(names.length, 1);
      expect(names[0], "Lukas");
    });

    test('Should clear list items', () {
      List<String> names = List();
      names.add("Lukas");
      names.clear();

      expect(names.length, 0);
      expect(()=> names[0], throwsA(TypeMatcher<RangeError>()));
    });

  });

}