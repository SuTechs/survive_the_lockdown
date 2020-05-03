import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:survivethelockdown/question.dart';
import 'package:survivethelockdown/constants.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class PlayGame extends StatefulWidget {
  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  bool isMute = false;
  bool isResult = false;
  int money = 0;
  int covidRisk = 0;
  String resultText = 'Hello Su Mit';
  bool isHomeLess = false;
  Brain b = Brain();

  void playAudio(String sound) {
    if (sound == "homeless") isHomeLess = true;

    if (!isMute) {
      if (sound == 'money')
        AssetsAudioPlayer.newPlayer().open(Audio("assets/money.mp3"));
      else if (sound == 'covid')
        AssetsAudioPlayer.newPlayer().open(Audio("assets/covid.mp3"));
      else if (sound == 'both') {
        AssetsAudioPlayer.newPlayer().open(Audio("assets/money.mp3"));
        AssetsAudioPlayer.newPlayer().open(Audio("assets/covid.mp3"));
      }
    }
  }

  void isGameOver() {
    int messageNo;
    bool isOver = false;

    if (money <= 0) {
      messageNo = 1;
      isOver = true;
    } else if (covidRisk >= 100) {
      messageNo = 2;
      isOver = true;
    } else if (b.getCurrentQuestionNumber() == 21) {
      messageNo = 0;
      isOver = true;
    }

    if (isOver) {
      Navigator.popAndPushNamed(context, 'GameOverPage',
          arguments: kGameOverMessage[messageNo]);
      b.resetGame();
      money = 0;
      covidRisk = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: <Widget>[
                /// Score Bar
                ScoreBar(covidRisk: covidRisk, money: money),

                ///Result
                Visibility(
                  visible: isResult,
                  child: ResultCard(
                    resultText: resultText,
                    onTap: () {
                      setState(() {
                        isResult = false;
                        isGameOver();
                        isHomeLess
                            ? Navigator.popAndPushNamed(context, 'GameOverPage',
                                arguments: kHomeLessMessage)
                            : null;
                        b.nextQuestion();
                      });
                    },
                  ),
                ),

                /// Game
                Visibility(
                  visible: !isResult,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          QuestionText(
                            questionText: b.getQuestionText(),
                          ),
                          WhatWillYouDoText(),
                          for (Answer option in b.getOptions())
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  money += option.money;
                                  covidRisk += option.covidRisk;
                                  resultText = option.result;
                                  playAudio(option.audio);
                                  isResult = true;
                                });
                              },
                              child: OptionCard(
                                answerText: option.answerText,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// Bottom Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMute = !isMute;
                        });
                      },
                      child: Icon(
                        isMute ? Icons.volume_mute : Icons.music_note,
                        size: 40,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      'DAY ${b.getCurrentQuestionNumber()}/21',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
