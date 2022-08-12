import 'package:flutter/material.dart';
import 'package:moviedb2/model/detail.dart';
import 'package:moviedb2/model/movie_request.dart';

class DetailNowPlaying extends StatefulWidget {
  const DetailNowPlaying({Key? key}) : super(key: key);

  @override
  State<DetailNowPlaying> createState() => _DetailNowPlayingState();
}

class _DetailNowPlayingState extends State<DetailNowPlaying> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Movie Detail",
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: FutureBuilder(
        future: getDetail(arguments['id'].toString()),
        builder: (context, AsyncSnapshot<Detail> snapshot) {
          print(snapshot.data?.title.toString());
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      snapshot.data != null
                          ? Container(
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500/${snapshot.data?.poster}",
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: 200,
                              height: 300,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                      // Image.network(
                      //   "https://image.tmdb.org/t/p/w500/" +
                      //       (snapshot.data as Map)[arguments['index']].title,
                      //   loadingBuilder: (context, child, loadingProgress) {
                      //     if (loadingProgress == null) return child;

                      //     return const Center(child: Text('Loading...'));
                      //   },
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OtherBox(
                            title: "Genre",
                            subtitle: snapshot.hasData
                                ? snapshot.data?.genre?.name as String
                                : "",
                            icon: Icons.videocam_rounded,
                          ),
                          OtherBox(
                            title: "Duration",
                            subtitle: snapshot.hasData
                                ? snapshot.data?.duration.toString() as String
                                : "",
                            icon: Icons.timelapse,
                          ),
                          OtherBox(
                            title: "Rating",
                            subtitle: snapshot.hasData
                                ? "${snapshot.data?.rating.toString()}/10"
                                : "",
                            icon: Icons.star_rounded,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 15),
                        child: Text(
                          snapshot.data != null
                              ? snapshot.data!.title.toString()
                              : "Loading..",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white10,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    "Synopsis",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  snapshot.data != null
                      ? snapshot.data!.overview as String
                      : "Loading",
                  style: TextStyle(color: Colors.white38),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class OtherBox extends StatelessWidget {
  const OtherBox({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);
  final String title, subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDetail('283552'),
      builder: (context, AsyncSnapshot<Detail> snapshot) {
        return Container(
            width: 110,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white10,
              ),
              borderRadius: BorderRadius.circular(13),
            ),
            child: snapshot.hasData
                ? Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              blurRadius: 10.0,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Icon(
                          icon,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        title,
                        style: TextStyle(color: Colors.white38, fontSize: 13),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ));
      },
    );
  }
}
