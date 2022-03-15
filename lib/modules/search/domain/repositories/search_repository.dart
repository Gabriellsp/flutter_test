import 'package:dartz/dartz.dart';
import 'package:flutter_tests/modules/search/domain/entities/result_search.dart';
import 'package:flutter_tests/modules/search/domain/exceptions/exceptions.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch?, List<ResultSearch>?>?>? search(
      String? searchText);
}
