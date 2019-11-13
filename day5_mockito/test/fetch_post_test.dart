import 'package:day5_mockito/main.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('fetchPost', () {
    test('returns a Post if the http call completes successfully', () async {
      final client = MockClient();

      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => Response('{"title": "Test"}', 200));

      expect(await fetchPost(client), const TypeMatcher<Post>());
    });

    test('throws an exception if the http call completes with an error',
        () async {
      final client = MockClient();

      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => Response('Not Found', 404));

      expect(fetchPost(client), throwsException);
    });
  });
}
