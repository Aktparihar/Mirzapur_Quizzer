class Question {
  String questionText;
  String choice1;
  String choice2;
  String choice3;
  String choice4;
  String questionAnswer;
  Question(String ques, String a, String b, String c, String d, String e) {
    questionText = ques;
    questionAnswer = e;
    choice1 = a;
    choice2 = b;
    choice3 = c;
    choice4 = d;
  }
}
