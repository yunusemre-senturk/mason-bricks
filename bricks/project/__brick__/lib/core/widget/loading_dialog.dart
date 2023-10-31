// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/core/res/images.dart';

class LoadingDialog {
  bool _isShow = false;
  late BuildContext _context;
  LoadingDialog._(BuildContext context) {
    if (!_isShow) {
      _context = context;
      _isShow = true;
      showDialog(
          useRootNavigator: true,
          barrierDismissible: false,
          context: _context,
          builder: (_) => WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: const Dialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: _Loading(
                    width: 56,
                  ),
                ),
              ));
    }
  }
  static LoadingDialog show(BuildContext context) {
    return LoadingDialog._(context);
  }

  void close() {
    if (_isShow) {
      _isShow = false;
      Navigator.of(_context, rootNavigator: true).pop();
    }
  }
}

class _Loading extends StatelessWidget {
  final double width;
  const _Loading({
    Key? key,
    this.width = 36,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Image(
          image: AppImages.loading,
          width: width,
        ),
      ),
    ));
  }
}
