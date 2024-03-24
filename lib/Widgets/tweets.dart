import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:twlike/Widgets/tweet.dart';

class Tweets extends StatefulWidget {
  const Tweets({super.key});

  @override
  State<Tweets> createState() => _TweetsState();
}

class _TweetsState extends State<Tweets> {
  Future<List<Tweet>> _getTweets() async {
    List<Tweet> tweets = [];

    final options = BaseOptions(
      baseUrl:
          'https://twitterlike.shrp.dev/items/tweets/0536904a-5aa2-40fd-bd11-f6d1f10e3b9e',
      //Retour ddd'une erreur 404...
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    final Dio api = Dio(options);
    try {
      final Response response = await api.get('/items/Tweets');

      if (response.statusCode == 200 || response.statusCode == 304) {
        for (Map<String, dynamic> json in response.data['data']) {
          Tweet tweet = Tweet.fromJson(json);
          tweets.add(tweet);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Error();
    }

    return tweets;
  }

  Tweet getTweet(int index) {
    Future<List<Tweet>> tweets = _getTweets();
    builder: (BuildContext context, AsyncSnapshot<List<Tweet>> snapshot) {
            if (snapshot.hasError) {
              if (kDebugMode) {
                print(snapshot.error);
              }
              return const Text("Error");
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final Tweet currentTweet = snapshot.data![index];

                  return ListTile(
                    tileColor: index % 2 == 0 ? Colors.pink[100] : Colors.white,
                    textColor: Colors.pinkAccent,
                    title: Text(currentTweet.name),
                    onTap: () => print(currentTweet.id),
                  );
                },}
                else {
              return const Center(child: CircularProgressIndicator());
            }}
              ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tweets"),
      ),
      body: Center(
        child: FutureBuilder<List<Tweet>>(
          future: _getTweets(),
          builder: (BuildContext context, AsyncSnapshot<List<Tweet>> snapshot) {
            if (snapshot.hasError) {
              if (kDebugMode) {
                print(snapshot.error);
              }
              return const Text("Error");
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final Tweet currentTweet = snapshot.data![index];

                  return ListTile(
                    tileColor: index % 2 == 0 ? Colors.pink[100] : Colors.white,
                    textColor: Colors.pinkAccent,
                    title: Text(currentTweet.name),
                    onTap: () => print(currentTweet.id),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
