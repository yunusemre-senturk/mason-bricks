import 'package:{{projectName.snakeCase()}}/core/base/base_view_model.dart';
import 'package:{{projectName.snakeCase()}}/core/source/local_data_source.dart';
import 'package:injectable/injectable.dart';

@injectable
class {{name.pascalCase()}}ViewModel extends BaseViewModel {
  LocalDataSource localDataSource;
  {{name.pascalCase()}}ViewModel(this.localDataSource);
}
