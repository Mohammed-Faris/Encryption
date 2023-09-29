import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlayerComponent extends StatefulWidget {
  final String videoUrl;

  const PlayerComponent({super.key, required this.videoUrl});

  @override
  State<PlayerComponent> createState() => _PlayerComponentState();
}

class _PlayerComponentState extends State<PlayerComponent> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.youtube.com/embed/jA14r2ujQ7s'),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
