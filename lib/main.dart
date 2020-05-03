import 'package:flutter/material.dart';
import 'package:survivethelockdown/screens/final_result_screen.dart';
import 'package:survivethelockdown/screens/game_screen.dart';
import 'screens/game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
      routes: {
        'PlayGame': (context) => PlayGame(),
        'GameOverPage': (context) => FinalScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RichText(
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
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'A 21-day lockdown has been announced by the Govt. as a response to the spread of COVID-19.\n\n',
                    style: TextStyle(fontSize: 18),
                    children: [
                      TextSpan(
                        text:
                            'You are a housemaid living with your two sons, an in-law, and your husband who is an auto driver.\n',
                      ),
                    ],
                  ),
                ),
                Text(
                  'Can You Survive the LockDown?',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.yellowAccent,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'PlayGame');
                  },
                  child: Container(
                    height: 90,
                    width: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green, Colors.red, Colors.pink],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Play Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Rule\n\n',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text:
                            'You lose the game when any of the following happens:\n\n',
                        style: TextStyle(fontSize: 18),
                        children: [
                          TextSpan(
                            text:
                                '• You run out of money\n\n• Your risk of COVID-19 reaches 100%',
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
