// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/app/data/service/api_service.dart';
import 'package:{{projectName.snakeCase()}}/core/source/local_data_source.dart';

abstract class {{name.pascalCase()}}Repository {

}

@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final ApiService _apiService;
  final LocalDataSource _dataSource;
  {{name.pascalCase()}}RepositoryImpl(this._apiService, this._dataSource);
} 