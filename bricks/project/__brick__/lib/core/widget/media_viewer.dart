// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/core/widget/image_network.dart';
import 'package:route_map/route_map.dart';

@RouteMap(fullScreenDialog: true)
class MediaViewerPage extends StatefulWidget {
  final List<dynamic> imageList;
  final int selectedIndex;
  const MediaViewerPage(this.imageList, {Key? key, this.selectedIndex = 0})
      : super(key: key);

  @override
  _MediaViewerPageState createState() => _MediaViewerPageState();
}

class _MediaViewerPageState extends State<MediaViewerPage> {
  PageController? _controller;
  int _selectedIndex = 0;
  double opacity = 0.8;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _controller = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            if (widget.imageList.length > 1)
              Text(
                "${_selectedIndex + 1}/${widget.imageList.length}",
                style: Theme.of(context).textTheme.titleSmall,
              )
          ],
        ),
        body: Stack(
          children: <Widget>[
            PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              controller: _controller,
              itemBuilder: (context, index) {
                var item = widget.imageList[index];

                return InteractiveViewer(child: Builder(builder: (context) {
                  if (item is File) {
                    return Image.file(item);
                  }
                  if (item is String && item.contains("http")) {
                    return ImageNetwork(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        )),
                      ),
                      imageUrl: item,
                    );
                  }
                  if (item is String) {
                    return ImageNetwork(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        )),
                      ),
                      imageUrl: item,
                    );
                  }

                  throw "Bilinmeyen tiphatası";
                }));
              },
              itemCount: widget.imageList.length,
            ),
          ],
        ));
  }
}
