import 'package:day5_mockito/Car.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockCar extends Mock implements Car {}

void main() {
  test('Test mock car', () {
    Car car = MockCar();
    when(car.getName()).thenAnswer((_) => "Mock Car");

    expect(car.getName(), "Mock Car");
  });
}