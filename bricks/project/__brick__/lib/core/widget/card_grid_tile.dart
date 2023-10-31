// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/core/res/dimens.dart';

class CardGridTile extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData icon;
  const CardGridTile({
    Key? key,
    this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.s),
          child: Column(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
