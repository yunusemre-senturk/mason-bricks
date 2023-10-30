// Package imports:

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

extension PaginationEx<PageKeyType, ItemType>
    on PagingController<PageKeyType, ItemType> {
  void appendLast(List<ItemType> newItems, PageKeyType nextPageKey) {
    if (newItems.isEmpty) {
      appendLastPage(newItems);
    } else {
      appendPage(newItems, nextPageKey);
    }
  }
}
