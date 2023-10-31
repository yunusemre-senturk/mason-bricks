import 'package:injectable/injectable.dart';

abstract class {{name.pascalCase()}}Repository {
}
@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  {{name.pascalCase()}}RepositoryImpl();
} 
