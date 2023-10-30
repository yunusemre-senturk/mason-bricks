// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/core/res/images.dart';

class LoadingView extends StatelessWidget {
  final double width;
  const LoadingView({
    Key? key,
    this.width = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image(
      image: AppImages.loading,
      width: width,
    ));
  }
}
