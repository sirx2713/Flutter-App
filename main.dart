import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const LandingView());
}

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background-plain.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    runApp(const GameView());
                  },
                  child: const Image(image: AssetImage("images/logo.png")))
            ],
          ),
        ),
      ),
    );
  }
}

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  int playerCardValue = 1;
  int cpuCardValue = 1;
  int playerScore = 0;
  int cpuScore = 0;
  var whoWon = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background-plain.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(image: AssetImage("images/logo.png")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage("images/card$playerCardValue.png")),
                  Image(image: AssetImage("images/card$cpuCardValue.png"))
                ],
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    playerCardValue = Random().nextInt(14) + 1;
                    cpuCardValue = Random().nextInt(14) + 1;

                    if(playerScore < 100 || cpuScore < 100){
                      if(playerCardValue > cpuCardValue){
                        playerScore += 5;
                      }
                      else if(cpuCardValue > playerCardValue){
                        cpuScore += 5;
                      }
                      else if(playerCardValue == cpuCardValue){
                        playerScore += 0;
                        cpuScore += 0;
                      }
                    }
                    else if(playerScore == 100){
                      whoWon = "Player";
                      playerScore = 0;
                      cpuScore = 0;
                      playerCardValue = 1;
                      cpuCardValue = 1;
                    }
                    else if(cpuScore == 100){
                      whoWon = "CPU";
                      playerScore = 0;
                      cpuScore = 0;
                      playerCardValue = 1;
                      cpuCardValue = 1;
                    }
                    else if(playerScore == 0 && cpuScore == 0){
                      whoWon = "";
                      playerCardValue = 1;
                      cpuCardValue = 1;
                    }
                  });
                },
                child: const Image(image: AssetImage("images/button.png")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Player",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$playerScore",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "CPU",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$cpuScore",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              // Text(
              //   whoWon.toUpperCase(),
              //   style: TextStyle(color: Colors.white, fontSize: 32),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
