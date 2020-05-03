import 'package:flutter/material.dart';
import 'package:survivethelockdown/constants.dart';
import 'package:survivethelockdown/screens/game_screen.dart';

class FinalScreen extends StatelessWidget {
//  final String finalMessage;
//  FinalScreen({@required this.finalMessage});

  @override
  Widget build(BuildContext context) {
    final finalMessage = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Survive\n',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      children: [
                        TextSpan(
                          text: 'The Lockdown',
                          style: TextStyle(fontSize: 32, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  finalMessage,
                  textAlign: TextAlign.center,
                  style: kFinalResultTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  kFinalMessage,
                  textAlign: TextAlign.center,
                  style: kFinalMessageTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, 'PlayGame');
                    },
                    child: Container(
                      height: 60,
                      width: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.red,
                            Colors.pink,
                            Colors.green,
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Play Again',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
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
    );
  }
}
