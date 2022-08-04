import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:move/constant/constant.dart';
import 'package:move/helper.dart';
import 'package:move/pages/details.dart';
import 'package:move/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/best_moves.dart';
import '../widgets/top10.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          "Movies",
          style: TextStyle(color: fontColor),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Top 10 ",
                        style: TextStyle(color: fontColor, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.3,
                  child: provider.movieLIst.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CarouselSlider.builder(
                          itemCount: provider.movieLIst.length,
                          itemBuilder: (context, index, realInde) {
                            return InkWell(
                              onTap: (() {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          Text("Loading.."),
                                          CircularProgressIndicator()
                                        ],
                                      ),
                                    );
                                  },
                                  barrierDismissible: false,
                                );
                                provider
                                    .getWatchKey(provider.movieLIst[index].id)
                                    .then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detailes(
                                              id: value,
                                              title: provider
                                                  .movieLIst[index].title,
                                              poster: provider
                                                  .movieLIst[index].poster_path,
                                              overView: provider
                                                  .movieLIst[index].overview)));
                                });
                              }),
                              child: Top10(
                                size: size,
                                img: provider.movieLIst[index].poster_path,
                                rate: provider.movieLIst[index].vote_average,
                                title: provider.movieLIst[index].title,
                              ),
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 1),
                            enlargeCenterPage: true,
                          )),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "best Moves ",
                    style: TextStyle(fontSize: 20, color: fontColor),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: size.height * 0.28,
                    child: provider.movieLIst2.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.movieLIst2.length,
                            itemBuilder: (context, index) {
                              return BestMove(
                                size: size,
                                name: provider.movieLIst2[index].title,
                                poster: provider.movieLIst2[index].poster_path,
                                rate: provider.movieLIst2[index].vote_average,
                              );
                            }),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.28,
                  child: provider.movieLIst2.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.movieLIst2.length,
                          itemBuilder: (context, index) {
                            return BestMove(
                              size: size,
                              name: provider.movieLIst3[index].title,
                              poster: provider.movieLIst3[index].poster_path,
                              rate: provider.movieLIst3[index].vote_average,
                            );
                          }),
                ),
              ],
            ),
          )),
    );
  }
}
