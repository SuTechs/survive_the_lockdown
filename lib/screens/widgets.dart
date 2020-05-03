import 'package:flutter/material.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({
    Key key,
    @required this.covidRisk,
    @required this.money,
  }) : super(key: key);

  final int covidRisk;
  final int money;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ScoreTexts(
          title: 'RISK OF\nCOVID 19',
          score: '$covidRisk%',
          textAlign: TextAlign.left,
        ),
        ScoreTexts(
          title: 'MONEY LEFT',
          textAlign: TextAlign.right,
          score: '$money',
        ),
      ],
    );
  }
}

class OptionCard extends StatelessWidget {
  final String answerText;
  OptionCard({this.answerText});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class WhatWillYouDoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'WHAT WILL YOU DO?',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 28,
        color: Colors.redAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class QuestionText extends StatelessWidget {
  final String questionText;
  QuestionText({this.questionText});

  @override
  Widget build(BuildContext context) {
    return Text(
      questionText,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 1),
    );
  }
}

class ResultCard extends StatelessWidget {
  final String resultText;
  final Function onTap;

  ResultCard({this.resultText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'RESULT',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: Column(
                    children: <Widget>[
                      Text(
                        resultText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 28,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: onTap,
                          child: Container(
                            height: 55,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'CONTINUE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreTexts extends StatelessWidget {
  final String title;
  final String score;
  final TextAlign textAlign;

  ScoreTexts({this.textAlign, this.title, this.score});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
          text: '$title\n',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
          children: [
            TextSpan(
              text: score,
              style: TextStyle(fontSize: 38, letterSpacing: 2),
            )
          ]),
    );
  }
}
