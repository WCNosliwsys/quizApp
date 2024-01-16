import 'package:quizzapp/service/question.dart';

class QuestionService {
  List<Question> questions = [
    Question(
        questionText: "Bedroom significa dormitorio", questionAnswer: true),
    Question(
        questionText: "Living room significa cocina", questionAnswer: false),
    Question(questionText: "Kitchen significa cocina", questionAnswer: true),
    Question(
        questionText: "El verbo Tobe nos referimos al ser y estar",
        questionAnswer: true),
    Question(
        questionText:
            "In, On, Under, Next To nos indican posicion de un objeto dentro, encima, abajo y al costado respectivamente",
        questionAnswer: true),
  ];
  int questionNumber = 0;
  String getQuestionText() {
    return questions[questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return questions[questionNumber].questionAnswer;
  }

  nextQuestion() {
    if (questionNumber < questions.length - 1) {
      questionNumber++;
    }
  }

  bool isFinished() {
    if (questionNumber >= questions.length - 1) {
      return true;
    }
    return false;
  }

  //Reiniciar el quiz

  void restart() {
    questionNumber = 0;
  }
}
