import 'package:flutter/material.dart';
import 'package:selfquizapp/elements/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import './data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.titilliumWeb(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 35)),
              ),
              const SizedBox(height: 30),
              ...currentQuestion.getshuffledAnswers().map((answer) {
                return AnswerButton(
                  answerValue: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              }),
            ]),
      ),
    );
  }
}
