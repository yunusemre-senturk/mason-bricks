import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:{{projectName.snakeCase()}}/core/base/base_widget.dart';
import 'package:{{projectName.snakeCase()}}/app/page/{{name.snakeCase()}}/{{name.snakeCase()}}_vm.dart';


@RouteMap()
class {{name.pascalCase()}}Page extends StatefulWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  State<{{name.pascalCase()}}Page> createState() => _{{name.pascalCase()}}PageState();
}

class _{{name.pascalCase()}}PageState extends BaseState<{{name.pascalCase()}}ViewModel ,{{name.pascalCase()}}Page> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
