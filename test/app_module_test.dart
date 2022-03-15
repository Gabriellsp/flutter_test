import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/app_module.dart';
import 'package:flutter_tests/modules/search/domain/entities/result_search.dart';
import 'package:flutter_tests/modules/search/domain/usecases/search_by_text.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

import 'modules/search/utils/github_responde.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  initModule(AppModule(), replaceBinds: [
    Bind<Dio>((i) => dio),
  ]);

  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });

  test('Deve trazer uma lista de ResultSearch', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: jsonDecode(jsondata),
          statusCode: 200,
          requestOptions: RequestOptions(path: ' '),
        ));
    final usecase = Modular.get<SearchByText>();
    final result = await usecase('gabriel');
    expect(result! | null, isA<List<ResultSearch>>());
  });
}
