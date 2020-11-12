import 'package:flutter/material.dart';
import 'package:mirzapur_quizz/quiz-dart.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

Quiz question = Quiz();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          title: Text(
            "Mirzapur",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int totalScore = 1;
  int totalQuestion = question.totalQuestion();
  List<Icon> scoreCard = [];
  void checkAnswer(String userAnswer) {
    var correctAnswer = question.getAnswer();
    setState(
      () {
        if (question.isFinished()) {
          Alert(
              context: context,
              title: "Completed",
              desc: "You scored $totalScore out of $totalQuestion",
              type: AlertType.success,
              buttons: [
                DialogButton(
                  child: Text(
                    "Restart",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  width: 120,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]).show();
          question.reset();
          totalScore = 1;
          scoreCard = [];
        } else {
          if (correctAnswer == userAnswer) {
            totalScore++;
            scoreCard.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            scoreCard.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
          question.nextQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  question.getQuestion(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: RaisedButton(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.lightBlue,
                        onPressed: () {
                          checkAnswer(question.getOption1());
                        },
                        child: Text(
                          question.getOption1(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: RaisedButton(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.deepOrangeAccent,
                        onPressed: () {
                          checkAnswer(question.getOption2());
                        },
                        child: Text(
                          question.getOption2(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: RaisedButton(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        checkAnswer(question.getOption3());
                      },
                      child: Text(
                        question.getOption3(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: RaisedButton(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.pink,
                      onPressed: () {
                        checkAnswer(question.getOption4());
                      },
                      child: Text(
                        question.getOption4(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: scoreCard,
          )
        ],
      ),
    );
  }
}
