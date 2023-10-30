// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:webview_flutter/webview_flutter.dart';

class PageReCaptcha extends StatefulWidget {
  final String url;

  const PageReCaptcha({Key? key, required this.url}) : super(key: key);

  @override
  _PageReCaptchaState createState() => _PageReCaptchaState();
}

class _PageReCaptchaState extends State<PageReCaptcha> {
  late WebViewController webViewController;
  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url))
      ..addJavaScriptChannel('RecaptchaFlutterChannel',
          onMessageReceived: (receiver) {
        String token = receiver.message;
        if (token.contains("verify")) {
          token = token.substring(7);
        }
        Navigator.of(context).pop(token);
      })
      ..setNavigationDelegate(NavigationDelegate(onPageFinished: (v) {
        webViewController.runJavaScript('''
                      function repeatingFunc() {
                      var tokenInput = document.getElementById("g-recaptcha-response-100001");
                      if (tokenInput == null) {
                      console.log("input null");
                      setTimeout(repeatingFunc, 1000);
                      } else if (tokenInput.value == undefined || tokenInput.value == "") {
                      console.log("captcha null");
                      setTimeout(repeatingFunc, 1000);
                      } else {
                      RecaptchaFlutterChannel.postMessage(tokenInput.value);
                      }
                      }
                      repeatingFunc();
                      ''');
      }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ReCaptcha"),
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
