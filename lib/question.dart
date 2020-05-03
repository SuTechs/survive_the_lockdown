class Question {
  String questionText;
  List<Answer> answers;

  Question({this.questionText, this.answers});
}

class Answer {
  String answerText;
  int money;
  int covidRisk;
  String result;
  String audio;
  Answer({
    this.answerText,
    this.result,
    this.covidRisk,
    this.money,
    this.audio = 'no',
  });
}

class Brain {
  int _questionNumber = 0;

  List<Question> _questions = [
    for (int i = 1; i <= _q.length; i++)
      Question(
        questionText: _q[i],
        answers: [
          for (int j = 1; j <= _options[i].length; j++)
            Answer(
              answerText: _options[i][j],
              result: _results[i][j],
              money: _scores[i]['money'][j],
              covidRisk: _scores[i]['covid'][j],
              audio: _scores[i]['audio'][j],
            )
        ],
      )
  ];

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() => _questions[_questionNumber].questionText;

  List<Answer> getOptions() => _questions[_questionNumber].answers;

  int getQuestionsLength() => _questions.length;
  int getCurrentQuestionNumber() => _questionNumber + 1;

  void resetGame() {
    _questionNumber = 0;
  }
}

/// Data
var _q = {
  1: "You would need money to see this lockdown through. But you have no savings.",
  2: "You now have some money in hand, remember that you would need to make do with this for the entire lockdown period. Choose your expenses carefully. Right now, you would need to stock up on food and cleaning supplies for the family.",
  3: "Your brother had gone to a neighbouring state for a work opportunity. Now that the government has issued a lockdown on its borders, you are worried about bringing him back home.",
  4: "Your son suddenly complains of fever and chest pain. You have read somewhere that these are symptoms of COVID-19. You are worried but you have to do something.",
  5: "You have been constantly reading about the importance of washing your hands as a preventive measure against the spread and contraction of the novel coronavirus. However, you have only two buckets of water that needs to be rationed among the five of you every day.",
  6: "The school that your children study at, used to take care of one of their daily meals. This meant reduced pressure on you for not only procuring food supplies but also cooking. However, with schools closed, your children are relying on you to be fed. With no source of income, additional mouths to feed and limited rations.",
  7: "Your husband is an alcoholic. With the sudden closure of local wine shops, he does not have access to his regular supply of alcohol. He is experiencing withdrawal symptoms, gets restless and violent.",
  8: "After  a week of silence, the Government has finally announced that they will be providing you with relief materials. You have to go to the ration shop in your neighborhood to access these supplies.",
  9: "You have been reading a lot of information on the importance of wearing masks. You decide it would be best for you to buy your family masks as you cannot practice social distancing. You rush to the pharmacy but you notice that the price of masks has increased drastically to Rs 80 Per piece.",
  10: "You had borrowed money for your sister\'s wedding six month ago and your repayment is due. In lieu of the lockdown, the moneylender has been calling you, demanding for his money of Rs. 2000.",
  11: "A supermarket just outside the slum is hiring door delivery workers and pays Rs. 500 for every five days of work. This extra money can help you with your situation even though it poses increased risk due to exposure. This also requires you to fix your son's broken cycle as the outlet only hires people who own a cycle.",
  12: "Your cooking gas is on the verge of running out.",
  13: "The Govt. has made masks mandatory for anyone who needs to step out of their home. The masks you bought initially were found to be of low quality, and hence cannot be used anymore.",
  14: "Your husband gets caught by the police for violating the lockdown while looking for alcohol shops. He is asked to pay a hefty fine or risk having his leased auto confiscated.",
  15: "The Fan in your house has stopped working. It costs Rs. 300 to fix.",
  16: "There\'s not enough space at home for the whole family to sit around.",
  17: "Since your kids\' schools have been shut down they are home for the most part of the day. You and your kids are not used to this. The kids get bored and restless and begin fighting with one another.",
  18: "Even after spending time explaining the situation to your kids, you are not being able to manage their behaviour. You are anxious about your loss of pay, about supporting your family and about your ailing mother/father at home.",
  19: "In the midst of the lockdown, your house-owner has come banging on your door demanding for this month\'s rent of Rs. 3000. You have already spent a portion of your savings on food and sanitation supplies.",
  20: "Your husband's lease for the auto is due. You have to pay this or risk losing the lease.",
  21: "In lieu of the end of the lockdown, you receive a whatsapp forward that Govt. is commensing bus and train operations. You see this as an opportunity to send your kids to the hometown where they can be cared for better by your mother. "
};
var _options = {
  1: {
    1: "Walk 12 Kms to your employers' house to collect the prorated salary of Rs. 3000.",
    2: "Borrow 6000 on Interest of 10% from the nearest money lender."
  },
  2: {
    1: "Food Supplies for a month-  Costing Rs. 900. ",
    2: "Cleaning supplies for a month - The cost of Hand wash is Rs 100 and Floor Cleaner is Rs 200. ",
    3: "Both the options."
  },
  3: {
    1: "Rush to the nearest bus depot which is heavily crowded and try to find an inter-state bus.",
    2: "Find unauthorized, dangerous ways to cross borders.",
    3: "Pay a Cargo Truck driver to let him get onboard. ( You would be lending Rs. 500 to him )."
  },
  4: {
    1: "Take the COVID-19 Test that costs Rs. 4000.",
    2: "Feed him home remedies."
  },
  5: {
    1: "Wash hands regularly and for 20 seconds each time instead of washing the house, clothes, utensils, cooking and taking a bath.",
    2: "Cook and clean utensils and the house, not worrying about washing hands and bathing for now."
  },
  6: {
    1: "Prioritise the intake of your children and in-laws over your own.",
    2: "Buy more Supplies at Rs. 900."
  },
  7: {
    1: "Ask him to leave home as you can\'t manage his behaviour.",
    2: "Take your kids and leave with them to the bus stand to find a way to reach your parents house.",
    3: "Bear the abuse, with the hope that it passes."
  },
  8: {
    1: "Rush to the ration shop on the day of the announcement, like your neighbours, thus becoming susceptible to the virus due to the crowds. Supplies for a month costs Rs. 300.",
    2: "Take the risk of supplies running out but stay safe at home away from the crowds. (You don\'t know when they will restock the free supplies)."
  },
  9: {
    1: "Buy 5 masks for the family at Rs. 400.",
    2: "Save the money to buy essentials. "
  },
  10: {
    1: "Agree to pay a penalty of Rs.1000 to buy more time.",
    2: "Pawn the last of your Jewellery, meaning you\'ll have nothing left if the lockdown continues and your money balance run out. You would get Rs. 4000 from this at 10% Interest."
  },
  11: {
    1: "Spend Rs. 500 for servicing the cycle and take up the job.",
    2: "Let this opportunity pass."
  },
  12: {
    1: "Apply for a new cylinder. This costs Rs. 500.",
    2: "Switch to using your Kerosene Stove. Kerosene costs Rs 50 per litre. You will need about 5 Litres to last a month.",
    3: "Setup firewood outside your home. Beware this weakens your lung, decreasing your chances of survival in case you do contract the virus."
  },
  13: {
    1: "Buy a set of high quality masks at Rs. 500 for the entire family. ",
    2: "Make home made masks from one of your three Sarees."
  },
  14: {1: "Pay fine of Rs. 500", 2: "Let the auto get confiscated."},
  15: {
    1: "Get it serviced by an electrician from your slum. Pay him half the money for now. ",
    2: "Let it be and focus on other challenges. "
  },
  16: {
    1: "Adjust, even if that means sitting on each other\'s laps for long periods of time.",
    2: "Sit at the entrance of your house while other members adjust inside.",
    3: "Take a walk around the slum to get some fresh air."
  },
  17: {
    1: "Spend on Coloring Books and Simple Toys to keep them occupied.",
    2: "Send the kids out of the house to play on the streets, like on any normal day.",
    3: "Get frustrated and leave the house yourself."
  },
  18: {
    1: "Decide to send your kids to the village to your parents. (Remember, old people are most susceptible).",
    2: "Lock them indoors and bear the ruckus they create. ",
    3: "Forcefully discipline them to control their behaviour."
  },
  19: {
    1: "Pay him Rs.1000 and request him to allow you to pay the balance later.",
    2: "Tell him you have no money as you have lost your job."
  },
  20: {1: "Pay Rs. 1000 and retain the lease.", 2: "Lose the lease."},
  21: {
    1: "Trust the whatsapp forward and start to walk to the bus stand so that you can ensure you get the ticket when the operations resume.",
    2: "Wait for official confirmation."
  }
};
var _results = {
  1: {
    1: "Got lathi-charged by Police, Rs. 200  was deducted for Hospital Bills, Balance Rs. 2800 credited to Wallet",
    2: "Rs. 5400 credited after deducting an interest of Rs. 600"
  },
  2: {
    1: "Rs. 900 deducted from Wallet,COVID-19 risk goes up by 10%",
    2: "Rs. 300 deducted from Wallet,You are going Hungry ",
    3: "Rs. 1200 deducted from Wallet"
  },
  3: {
    1: "Risk of COVID-19 increases by 10%.",
    2: "Risk of COVID-19 increased by 10%",
    3: "Rs. 500 deducted from Wallet."
  },
  4: {
    1: "Rs. 4000 deducted from Wallet.",
    2: "Risk of COVID-19 increases by 20%"
  },
  5: {
    1: "You are keeping your family safe. ",
    2: "Risk of COVID-19 increases by 10%."
  },
  6: {
    1: "You are going Hungry. ",
    2: "Rs. 900 deducted from Wallet, Risk of COVID-19 increases by 10%."
  },
  7: {
    1: "Husband reacts violently and snatches Rs. 500 to buy alcohol from the black market.",
    2: "You find that there is absolutely no transport available,Risk of COVID-19 Increases by 10% for stepping out.",
    3: "You are losing peace at Home."
  },
  8: {
    1: "Rs. 300 deducted from wallet, Risk of COVID-19 Increases by 10%",
    2: "You are going Hungry."
  },
  9: {
    1: "Rs. 400 deducted from Wallet.",
    2: "Risk of COVID-19 increases by 10%."
  },
  10: {
    1: "Rs. 1000 deducted from Wallet as penalty.",
    2: "Rs. 2000 paid to the lender and Rs. 400 deducted for Interest, Balance Rs. 1600 credited to the Wallet."
  },
  11: {
    1: "Rs. 500  deducted from Wallet, Risk of COVID increases by 20%",
    2: "You lost an opportunity to earn some money during the current situation."
  },
  12: {
    1: "Rs. 500 deducted from Wallet. ",
    2: "Rs. 250 deducted from Wallet. ",
    3: "You are weakening your lungs which needs to be at their strongest to survive in case you contract COVID-19."
  },
  13: {
    1: "Rs. 500 deducted from Wallet.",
    2: "You now have only two Sarees to wear."
  },
  14: {
    1: "Rs. 500 deducted from Wallet.",
    2: "Your husband has lost his only means of income."
  },
  15: {
    1: "Rs. 150 deducted from Wallet.",
    2: "The heat becomes unbearable as it's summer right now."
  },
  16: {
    1: "You realize they cant do this forever. ",
    2: "Risk of COVID-19 Increases by 10%",
    3: "Risk of COVID-19 Increases by 20%"
  },
  17: {
    1: "Rs. 100 deducted from Wallet",
    2: "Risk of COVID-19 Increases by 10%.",
    3: "Risk of COVID-19 Increases by 10%."
  },
  18: {
    1: "Risk of COVID-19 Increases by 10%",
    2: "You are losing the peace at Home.",
    3: "You are losing the peace at Home"
  },
  19: {
    1: "Rs. 1000 deducted from Wallet.",
    2: "You are now Homeless - Lost the Game"
  },
  20: {
    1: "Rs. 1000 deducted from Wallet, You have retained the auto but there is no earnings from it for the foreseeable future. ",
    2: "Your husband has lost his only means of income."
  },
  21: {
    1: "Risk of COVID-19 Increases by 10%.",
    2: "You risk missing the first couple of trains."
  }
};
var _scores = {
  1: {
    'money': {
      1: 2800,
      2: 5400,
    },
    'covid': {
      1: 0,
      2: 0,
    },
    'audio': {
      1: "money",
      2: "money",
    },
  },
  2: {
    'money': {1: -900, 2: -300, 3: -1200},
    'covid': {1: 10, 2: 0, 3: 0},
    'audio': {1: 'both', 2: "money", 3: "money"},
  },
  3: {
    'money': {1: 0, 2: 0, 3: -500},
    'covid': {1: 10, 2: 10, 3: 0},
    'audio': {1: 'covid', 2: "covid", 3: "money"},
  },
  4: {
    'money': {
      1: -4000,
      2: 0,
    },
    'covid': {
      1: 0,
      2: 20,
    },
    'audio': {
      1: 'money',
      2: "covid",
    },
  },
  5: {
    'money': {1: 0, 2: 0},
    'covid': {1: 0, 2: 10},
    'audio': {1: 'no', 2: "covid"},
  },
  6: {
    'money': {1: 0, 2: -900},
    'covid': {1: 0, 2: 10},
    'audio': {1: 'no', 2: "both"},
  },
  7: {
    'money': {1: -500, 2: 0, 3: 0},
    'covid': {1: 0, 2: 10, 3: 0},
    'audio': {1: 'money', 2: "covid", 3: 'no'},
  },
  8: {
    'money': {1: -300, 2: 0},
    'covid': {1: 10, 2: 0},
    'audio': {1: 'both', 2: "no"},
  },
  9: {
    'money': {1: -400, 2: 0},
    'covid': {1: 0, 2: 10},
    'audio': {1: 'money', 2: "covid"},
  },
  10: {
    'money': {1: -1000, 2: 1600},
    'covid': {1: 0, 2: 0},
    'audio': {1: 'money', 2: "money"},
  },
  11: {
    'money': {1: -1000, 2: 1600},
    'covid': {1: 0, 2: 0},
    'audio': {1: 'money', 2: "money"},
  },
  12: {
    'money': {1: -500, 2: -250, 3: 0},
    'covid': {1: 0, 2: 0, 3: 0},
    'audio': {1: 'money', 2: "money", 3: "no"},
  },
  13: {
    'money': {1: -500, 2: 0},
    'covid': {1: 0, 2: 0},
    'audio': {1: 'money', 2: "no"},
  },
  14: {
    'money': {1: -500, 2: 0},
    'covid': {1: 0, 2: 0},
    'audio': {1: 'money', 2: "no"},
  },
  15: {
    'money': {1: -150, 2: 0},
    'covid': {1: 0, 2: 0},
    'audio': {1: 'money', 2: "no"},
  },
  16: {
    'money': {1: 0, 2: 0, 3: 0},
    'covid': {1: 0, 2: 10, 3: 20},
    'audio': {1: 'money', 2: "covid", 3: "covid"},
  },
  17: {
    'money': {1: -100, 2: 0, 3: 0},
    'covid': {1: 0, 2: 10, 3: 10},
    'audio': {1: 'money', 2: "covid", 3: "covid"},
  },
  18: {
    'money': {1: 0, 2: 0, 3: 0},
    'covid': {1: 10, 2: 0, 3: 0},
    'audio': {1: 'covid', 2: "no", 3: "no"},
  },
  19: {
    'money': {1: -100, 2: 0},
    'covid': {1: 0, 2: 0},
    'audio': {1: 'money', 2: "homeless"},
  },
  20: {
    'money': {1: -1000, 2: 0},
    'covid': {1: 0, 2: 0},
    'audio': {1: 'money', 2: "no"},
  },
  21: {
    'money': {1: 0, 2: 0},
    'covid': {1: 10, 2: 0},
    'audio': {1: 'covid', 2: "no"},
  },
};
