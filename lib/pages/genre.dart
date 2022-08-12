import 'package:flutter/material.dart';
import 'package:moviedb2/model/movie_request.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({Key? key}) : super(key: key);

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(arguments['name']),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getGenre(arguments['idGenre'].toString()),
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'detail',
                          arguments: {
                            'id': snapshot.data![index].id,
                          },
                        );
                      },
                      child: Container(
                        // width: 100,
                        // height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500/" +
                                  snapshot.data![index].posterPath.toString(),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data?.length,
                ));
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
