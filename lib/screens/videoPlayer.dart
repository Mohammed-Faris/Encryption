import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storagesecure/models/youtubemodel.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _YoutubePlayerDemoState createState() => _YoutubePlayerDemoState();
}

class _YoutubePlayerDemoState extends State<VideoPlayer> {
  late YoutubePlayerController _ytbPlayerController;
  List<YoutubeModel> videosList = [
    YoutubeModel(id: 1, YoutubeId: 'jA14r2ujQ7s'),
    YoutubeModel(id: 2, YoutubeId: 'UQGoVB_zMYQ'),
    YoutubeModel(id: 3, YoutubeId: 'FLcRb289uEM'),
    YoutubeModel(id: 4, YoutubeId: 'g2nMKzhkvxw'),
    YoutubeModel(id: 5, YoutubeId: 'qoDPvFAk2Vg'),
  ];

  @override
  void initState() {
    super.initState();

    _setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (videosList.isNotEmpty) {
        setState(() {
          _ytbPlayerController = YoutubePlayerController(
            initialVideoId: videosList[0].YoutubeId,
            params: const YoutubePlayerParams(
              showFullscreenButton: true,
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _ytbPlayerController.close();
  }

  _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildYtbView(),
            _buildMoreVideoTitle(),
            _buildMoreVideosView(),
          ],
        ),
      ),
    );
  }

  _buildYtbView() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _ytbPlayerController != null
          ? YoutubePlayerIFrame(controller: _ytbPlayerController)
          : const Center(child: CircularProgressIndicator()),
    );
  }

  _buildMoreVideoTitle() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(14, 10, 182, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "More videos",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  _buildMoreVideosView() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            itemCount: videosList.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final newCode = videosList[index].YoutubeId;
                  _ytbPlayerController.load(newCode);
                  _ytbPlayerController.stop();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Positioned(
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://img.youtube.com/vi/${videosList[index].YoutubeId}/0.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          child: Align(
                            alignment: Alignment.center,
                            // child: Image.asset(
                            //   'assets/ytbPlayBotton.png',
                            //   height: 30,
                            //   width: 30,
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
