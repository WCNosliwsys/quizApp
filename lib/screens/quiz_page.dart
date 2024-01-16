import 'package:flutter/material.dart';
import 'package:quizzapp/service/question_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuestionService miQuiz = QuestionService();

  List<Widget> puntaje = [];
  int correctas = 0;

  checkAnswer(bool miRespuesta) {
    bool correctAnswer = miQuiz.getQuestionAnswer();
    if (correctAnswer == miRespuesta) {
      puntaje.add(
        Icon(
          Icons.check,
          color: Colors.greenAccent,
        ),
      );
      correctas++;
    } else {
      puntaje.add(
        Icon(
          Icons.close,
          color: Colors.redAccent,
        ),
      );
    }
    if (!miQuiz.isFinished()) {
      miQuiz.nextQuestion();
    } else {
      Alert(
        context: context,
        type: AlertType.success,
        title: "QuizApp",
        desc:
            "El quiz ha finalizado, tu puntaje ha sido $correctas de ${puntaje.length}",
        buttons: [
          DialogButton(
            child: Text(
              "Aceptar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

      miQuiz.restart();
      puntaje.clear();
      correctas = 0;
    }
    setState(() {});

    print(puntaje);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QuizPage",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: Center(
            child: Container(
              child: Text(
                miQuiz.getQuestionText(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )),
          GestureDetector(
            onTap: () {
              checkAnswer(true);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 80,
              color: Colors.green,
              child: Center(
                  child: Text(
                "Verdadero",
                style: TextStyle(fontWeight: FontWeight.w900),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              checkAnswer(false);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 80,
              color: Colors.red,
              child: Center(
                  child: Text(
                "Falso",
                style: TextStyle(fontWeight: FontWeight.w900),
              )),
            ),
          ),
          Row(
            children: puntaje,
          ),
        ]),
      ),
    );
  }
}
