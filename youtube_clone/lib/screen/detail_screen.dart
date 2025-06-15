import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/vedio_model.dart';
import 'package:flutter_application_1/provider/theme_provider.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends StatefulWidget {
  final VideoModel model;
  const DetailScreen({super.key, required this.model});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.model.videoUrl)
      ..initialize()
          .then((_) {
            setState(() {
              _isInitialized = true;
              _controller.play();
            });
          })
          .catchError((error) {
            print("Video initialization error: $error");
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          _isInitialized
              ? Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Center(
                        child: !_controller.value.isPlaying
                            ? IconButton(
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 60,
                                  color: themProvider.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _controller.play();
                                  });
                                },
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ],
                )
              : Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(widget.model.thumnailImg),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.model.title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: themProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.model.dayAgo + " - " + widget.model.viewCount,
                          style: Theme.of(context).textTheme.headlineMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _actionRow(
                            themProvider,
                            context,
                            Icons.thumb_up,
                            widget.model.likeCount,
                          ),
                          _actionRow(
                            themProvider,
                            context,
                            Icons.thumb_down,
                            widget.model.unlikeCount,
                          ),
                          _actionRow(
                            themProvider,
                            context,
                            Icons.share,
                            'Share',
                          ),
                          _actionRow(
                            themProvider,
                            context,
                            Icons.download,
                            'Download',
                          ),
                          _actionRow(
                            themProvider,
                            context,
                            Icons.bookmark,
                            'Save',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(widget.model.profileImg),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model.username,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              widget.model.subscriberCount + " subscribers",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "SUBSCRIBE",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 0, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Up next",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Row(
                            children: [
                              Text(
                                "Autoplay",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                              Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(detailVideoList.length, (i) {
                            final data = detailVideoList[i];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        (MediaQuery.of(context).size.width -
                                            50) /
                                        2,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          data.thumnailImg,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 10,
                                          right: 12,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(
                                                0.8,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                3.0,
                                              ),
                                              child: Text(
                                                data.videoDuration
                                                        .toString() ??
                                                    '7.05',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width:
                                              130,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.model.title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                     
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.3,
                                                      fontSize: 14,
                                                    ),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),

                                              Text(
                                                widget.model.username,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium!
                                                    .copyWith(
                                                     
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                widget.model.viewCount +
                                                    " views - " ,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium!
                                                    .copyWith(
                                                   
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionRow(
    ThemeProvider themProvider,
    BuildContext context,
    IconData icon,
    String text,
  ) {
    return Column(
      children: [
        Icon(icon, size: 25),
        SizedBox(height: 5),
        Text(text, style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
