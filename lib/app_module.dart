import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tests/app_widget.dart';
import 'package:flutter_tests/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_tests/modules/search/external/datasources/github_datasource.dart';
import 'package:flutter_tests/modules/search/infra/repositories/search_repository_impl.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDatasource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
      ];

  @override
  List<Router> get routers => throw UnimplementedError();

  @override
  Widget get bootstrap => const AppWidget();
}
