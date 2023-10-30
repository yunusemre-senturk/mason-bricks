// Flutter imports:
import 'package:flutter/material.dart';

class MediaGridView<T> extends StatelessWidget {
  final List<T> mediaList;
  final int maxItemCount;
  final int? crossAxisCount;
  final Function(int, String)? onRemove;

  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final Widget Function(BuildContext context)? addBuilder;
  const MediaGridView({
    Key? key,
    required this.mediaList,
    required this.maxItemCount,
    this.onRemove,
    this.addBuilder,
    required this.itemBuilder,
    this.crossAxisCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return crossAxisCount == null
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int i) {
              var index = i;
              if (addBuilder != null && mediaList.length < maxItemCount) {
                index = i - 1;
                if (i == 0) {
                  return addBuilder!.call(context);
                }
              }
              return itemBuilder.call(context, index, mediaList[index]);
            },
            itemCount: addBuilder == null || mediaList.length == maxItemCount
                ? mediaList.length
                : mediaList.length + 1)
        : GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  addBuilder == null && mediaList.isEmpty ? 1 : crossAxisCount!,
            ),
            itemBuilder: (BuildContext context, int index) =>
                index == mediaList.length
                    ? addBuilder!.call(context)
                    : itemBuilder.call(context, index, mediaList[index]),
            itemCount: addBuilder != null && mediaList.length < maxItemCount
                ? mediaList.length + 1
                : mediaList.length);
  }
}
