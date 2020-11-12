import 'package:flutter/material.dart';
import 'question.dart';

class Quiz {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question(
        "Both Guddu & Bablu are third-year students. What are they studying? ",
        "Economics",
        "B.Com",
        "B.A(Pass)",
        "B.Sc Mathematics",
        "B.Com"),
    Question(
        "Divyendu Sharam aka Munna made his debut in a film that has a cult following. His nickname in the film was “Liquid.” What was his character’s real name?",
        "Nishant Kumar",
        "Nitish Agarwal",
        "Nishant Agarwal",
        "Nishant Thakur",
        "Nishant Agarwal"),
    Question(
        "The last episode of Mirzapur has a number of scenes which were inspired by a hugely popular show that had a very disappointing end. Which TV series are we talking about?",
        "House of Cards",
        "Narcos",
        "The Sopranos",
        "Games of Thrones",
        "Games of Thrones"),
    Question(
        "Who ruled over Mirzapur before the Tripathi family?",
        "The Choudhary",
        "The Thakkurs",
        "The Singhs",
        "The Choubeys",
        "The Choudhary"),
    Question(
        "What is the name of the college that Munna & Guddu attend?",
        "Ghanshyam Binnani",
        "Gajjumal College",
        "Engineering College Mirzapur",
        "Ram Lalit Singh College",
        "Gajjumal College"),
    Question(
        "The compounder in Mirzapur is played by Abhishek Banerjee, who rose to fame with his performances in Stree & Paatal Lok. With which web series did he make his OTT debut?",
        "Humorously Yours",
        "Typewriter",
        "TV Pitchers",
        "Kota Factory",
        "TV Pitchers"),
  ];
  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  String getOption1() {
    return _questionBank[_questionNumber].choice1;
  }

  String getOption2() {
    return _questionBank[_questionNumber].choice2;
  }

  String getOption3() {
    return _questionBank[_questionNumber].choice3;
  }

  String getOption4() {
    return _questionBank[_questionNumber].choice4;
  }

  String getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void reset() {
    _questionNumber = 0;
  }

  void nextQuestion() {
    if (_questionNumber <= _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int totalQuestion() {
    return _questionBank.length;
  }
}
