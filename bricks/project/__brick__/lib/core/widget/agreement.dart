// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/core/res/colors.dart';
import 'package:{{projectName.snakeCase()}}/core/res/dimens.dart';
import 'package:route_map/route_map.dart';

@RouteMap(fullScreenDialog: true)
class AgreementPage extends StatefulWidget {
  final String title;
  final String body;
  final bool isShowAction;

  const AgreementPage(
      {Key? key,
      required this.title,
      required this.body,
      this.isShowAction = true})
      : super(key: key);

  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  final ScrollController _scrollController = ScrollController();
  bool showAcceptButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double currentPosition = _scrollController.position.pixels;
      double maxPosition = _scrollController.position.maxScrollExtent;
      if (currentPosition > (maxPosition - 50)) {
        setState(() {
          showAcceptButton = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var contentBase64 = utf8.decode(const Utf8Encoder().convert(widget.body));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.m),
          child: InteractiveViewer(
            child: Text(contentBase64),
          ),
        ),
      ),
      bottomNavigationBar: widget.isShowAction && showAcceptButton
          ? Container(
              color: AppColors.primarySwatch,
              child: SafeArea(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(
                    "OKUDUM ve KABUL EDİYORUM",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
