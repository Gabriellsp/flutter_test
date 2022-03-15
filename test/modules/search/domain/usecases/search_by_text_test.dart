import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/modules/search/domain/entities/result_search.dart';
import 'package:flutter_tests/modules/search/domain/exceptions/exceptions.dart';
import 'package:flutter_tests/modules/search/domain/repositories/search_repository.dart';
import 'package:flutter_tests/modules/search/domain/usecases/search_by_text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test('Deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));

    final result = await usecase("gabriel");
    expect(result, isA<Right>());
    expect(result! | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar um Exception caso o texto seja invalido', () async {
    when(repository.search(any))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));

    var result = await usecase(null);
    // expect(result, isA<Right>());
    // expect(result.isLeft(), true);
    expect(result!.fold(id, id), isA<InvalidTextError>());
    result = await usecase('');
    expect(result!.fold(id, id), isA<InvalidTextError>());
  });
}
