import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  Color customcolor(var value1, var value2) {
    if (value1 == value2) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.actor(
                          fontSize: 21,
                          color: customcolor(data['correct_answers'] as String,
                              data['user_answers'] as String),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.barlow(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['user_answers'] as String,
                            style: GoogleFonts.actor(
                                fontSize: 19,
                                color: customcolor(
                                    data['correct_answers'] as String,
                                    data['user_answers'] as String),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            data['correct_answers'] as String,
                            style: GoogleFonts.actor(
                                fontSize: 19, color: Colors.green),
                          ),
                        ],
                      ),
                    )
                  ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
