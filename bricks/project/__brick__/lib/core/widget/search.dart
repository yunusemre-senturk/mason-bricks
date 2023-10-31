// Flutter imports:
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  final String hintText;
  final Function(String) callback;
  final TextEditingController? textEditingController;
  final int autoSearchLength;
  const SearchView({
    Key? key,
    this.hintText = "Ara",
    required this.callback,
    this.autoSearchLength = 0,
    this.textEditingController,
  }) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final FocusNode _focusNode = FocusNode();
  String query = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextField(
        focusNode: _focusNode,
        autofocus: false,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (v) {
          setState(() {
            query = v;
            if (v.length >= widget.autoSearchLength) {
              widget.callback(v);
            }
          });
        },
        onSubmitted: (v) {
          widget.callback(v);
          _focusNode.unfocus();
        },
        controller: widget.textEditingController,
        decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: const Icon(Icons.search),
            border: InputBorder.none,
            suffixIcon: query.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        query = "";
                        widget.textEditingController?.text = "";
                        widget.callback("");
                      });
                    },
                    child: const Icon(Icons.clear))
                : null),
      ),
    );
  }
}
