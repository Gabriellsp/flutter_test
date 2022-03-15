import 'package:flutter_tests/modules/search/domain/exceptions/exceptions.dart';
import 'package:flutter_tests/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_tests/modules/search/domain/repositories/search_repository.dart';
import 'package:flutter_tests/modules/search/infra/datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch?, List<ResultSearch>?>?>? search(
      String? searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
