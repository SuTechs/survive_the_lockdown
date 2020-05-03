import 'package:flutter/material.dart';

const String kSurvivedMessage = 'Congrats! You have survived.';

const String kHomeLessMessage =
    'You are Homeless.\nSorry, You couldn’t survive.';

const String kBankruptMessage =
    'You have gone bankrupt!\n Sorry, You couldn’t survive.';

const String kInfectedMessage =
    'You are infected with COVID-19\n Sorry, You couldn’t survive.';

const String kFinalMessage =
    "Lakhs of families are fighting this lockdown one meal at a time. Many have been displaced, lost their livelihood, stripped of all savings, pushed back by years of hard work and toil, without even a clarity on when this crisis would end. We request you to support the NGOs that are doing all they can to help the underprivileged families in surviving this crisis. Share this game with your circle to help spread the word too. Thanks for playing!";

const kFinalResultTextStyle = TextStyle(
  fontSize: 32,
  color: Colors.pink,
  fontWeight: FontWeight.bold,
);

const kFinalMessageTextStyle =
    TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1);

const List<String> kGameOverMessage = [
  kSurvivedMessage,
  kBankruptMessage,
  kInfectedMessage
];
