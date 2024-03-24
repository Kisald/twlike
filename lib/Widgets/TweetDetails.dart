import 'package:flutter/material.dart';
import 'package:twlike/Widgets/tweets.dart';

//Impossible de tester car inpossible de récupérer les tweets
//Doit etre appelé avec une fonction onTap() sur un tweet

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late double wHeight = 0;
  late double wWidth = 0;
  @override
  Widget build(BuildContext context) {
    wHeight = MediaQuery.of(context).size.height;
    wWidth = MediaQuery.of(context).size.width;
    const color = const Color(0xFFFCE68E);
    return Scaffold(
      appBar: AppBar(
        title: Text("Information sur le tweet",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
            onPressed: () {
              Tweets();
            },
            icon: Icon(Icons.close)),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                height: wHeight * 0.7 / 4,
                width: wWidth * 0.8,
                color: Colors.white,
                child: Text(
                  'Titre du tweet',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
            Container(
                height: wHeight * 0.7 / 4,
                width: wWidth * 0.8,
                color: Colors.grey,
                child: Text(
                  'Auteur',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
            Container(
              height: wHeight * 0.7 / 4,
              width: wWidth * 0.8,
              color: Colors.white,
              child: Text('Contenu du tweet',
                  maxLines: 30,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                  )),
            ),
            Container(
              height: wHeight * 0.7 / 4,
              width: wWidth * 0.8,
              color: Colors.grey,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage'/temp/tweetImage.png')),
            ),
          ],
        ),
      ),
    );
  }
}
