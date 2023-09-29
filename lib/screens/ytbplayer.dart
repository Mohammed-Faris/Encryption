import 'package:flutter/material.dart';
import 'package:storagesecure/components/playercomponent.dart';

class YtbPlayer extends StatelessWidget {
  const YtbPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('YouTube Video Player Demo'),
        ),
        body: const AspectRatio(
          aspectRatio: 16 / 9,
          child: PlayerComponent(
            videoUrl: 'https://www.youtube.com/embed/jA14r2ujQ7s',
          ),
        ),
      ),
    );
  }
}
