import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constant/constant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Detailes extends StatefulWidget {
  Detailes({
    Key? key,
    required this.id,
    required this.title,
    required this.poster,
    required this.overView,
  }) : super(key: key);

  final String id;
  final String title;
  final String poster;
  final String overView;

  @override
  State<Detailes> createState() => _DetailesState();
}

class _DetailesState extends State<Detailes> {
  YoutubePlayerController? youtubePlayerController;
  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
            'https://www.youtube.com/watch?v=${widget.id}')!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          isLive: false,
          mute: false,
          loop: false,
        ));
    super.initState();
  }

  @override
  void deactivate() {
    youtubePlayerController!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    youtubePlayerController!.dispose();
    super.dispose();
  }

  void lanchUrl(String urlString) async {
    await canLaunchUrlString(urlString)
        ? await launchUrlString(urlString)
        : throw 'Couldt launch $urlString';
  }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _link = 'https://one.akwam.cc/search?q=${widget.title}';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          "Movies",
          style: TextStyle(color: fontColor),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${widget.poster}'),
                  fit: BoxFit.fill),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.025,
                ),
                Container(
                  height: size.height * 0.3,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Watch trailer",
                          style: TextStyle(color: fontColor, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.85,
                        child: YoutubePlayer(
                          controller: youtubePlayerController!,
                          onReady: () {
                            youtubePlayerController!.play();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: fontColor, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(widget.overView,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: fontColor, fontSize: 20)),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
         onPressed: (){
          launchUrlString(_link);
         },
          label: const Text("Search to Akwam")),
    );
  }
}
