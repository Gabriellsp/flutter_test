import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/modules/search/domain/exceptions/exceptions.dart';
import 'package:flutter_tests/modules/search/external/datasources/github_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/github_responde.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);

  test('deve retornar uma lista de ResultSearchModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: jsonDecode(jsondata),
          statusCode: 200,
          requestOptions: RequestOptions(path: ' '),
        ));
    final future = datasource.getSearch('gabriel');
    expect(future, completes);
  });

  test('deve retornar um DataSourceError se o código nao for 200', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: null,
          statusCode: 401,
          requestOptions: RequestOptions(path: ' '),
        ));
    final future = datasource.getSearch('gabriel');
    expect(future, throwsA(isA<DataSourceError>()));
  });

  test('deve retornar um Exception se tiver um erro no dio', () async {
    when(() => dio.get(any())).thenThrow(Exception());
    final future = datasource.getSearch('gabriel');
    expect(future, throwsA(isA<Exception>()));
  });
}
