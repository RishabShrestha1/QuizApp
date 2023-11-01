import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './data/questions.dart';
import './question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onExit});
  final Function() onExit;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      //map structure
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answers': questions[i].answers[0],
        'user_answers': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final sumnmaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = sumnmaryData.where((data) {
      if (data['user_answers'] as String == data['correct_answers']) {
        return true;
      } else {
        return false;
      }
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello you answered $numCorrectQuestion out of $numTotalQuestion correctly',
              style:
                  GoogleFonts.oswald(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(height: 30),
            TextButton(onPressed: onExit, child: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
