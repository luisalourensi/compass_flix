import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pb/components/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];

  final String apikey = "66efbc171cd29e93fa8c3ed29e8b268d";
  final readacesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NmVmYmMxNzFjZDI5ZTkzZmE4YzNlZDI5ZThiMjY4ZCIsInN1YiI6IjYxYjllMTJiZDE0NDQzMDA2Njk2ZWY4MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qPMfzNN9c0kZAvwDUnfDEvd0JmHLC4iZbSA3EbxtAwc";

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readacesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();

    setState(() {
      trendingMovies = trendingresult['results'];
    });
    //allMovies();
  }

  /* allMovies() {
    trendingMovies = trendingMoviesAll;
  }

  searchMovies(String searchTitle) {
    trendingMoviesAll.forEach((element) {
      if (customesContainers(searchTitle)) {
        trendingMovies.add(element);
      }
    });
    setState(() {});
  }

  customesContainers(String titleMovies) {
    var isContains = false;
    trendingMovies.forEach((element) {
      String title = element.title.Trim()  'e';
      if (title.contains(titleMovies)) {
        isContains = true;
      }
    });
    print(isContains);
    print(titleMovies);
    return isContains;
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.center,
        ),
        title: Container(
          height: 50,
          child: Text(
            "CompassFlix",
            style: TextStyle(color: Colors.grey),
          ),
          alignment: Alignment.center,
        ),
        actions: [
          SizedBox(
            width: 60,
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            TrendingMovies(
              trending: trendingMovies,
            ),
          ],
        ),
      ),
    );
  }
}
