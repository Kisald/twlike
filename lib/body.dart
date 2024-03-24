import 'package:flutter/material.dart';
import 'tweets.dart';

class body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const color = const Color(0xFFFCE68E);
    return MaterialApp(
      title: "Twitter-Like",
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: color,
            brightness: Brightness.dark,
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text("twitter-like",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Center(
          child: Tweets(),
        ),
      ),
    );
  }
}
