// Flutter imports:
import 'package:flutter/material.dart';

Future<T?> showActionMenu<T>(BuildContext context,
    {required List<Widget> actions, bool useRootNavigator = true}) {
  return showModalBottomSheet(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (c) => ListView(
          shrinkWrap: true,
          children:
              ListTile.divideTiles(context: context, tiles: actions).toList()));
}

Future<T?> showActionMenu2<T>(BuildContext context,
    {required List<Widget> Function(BuildContext) actionsBuilder,
    bool useRootNavigator = true}) {
  return showModalBottomSheet(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (c) => ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: ListTile.divideTiles(
                    context: context, tiles: actionsBuilder.call(c))
                .toList(),
          ));
}
