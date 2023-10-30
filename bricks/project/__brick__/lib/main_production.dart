// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/app/page/app/app.dart';
import 'package:{{projectName.snakeCase()}}/bootstrap.dart';

void main() async {
  bootstrap(() => const MainApp(), Environment.prod);
}
