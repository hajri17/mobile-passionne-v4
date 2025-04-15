import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  String selectedAnswer = '';
  bool isAnswered = false;
  bool isCorrect = false;

  List<dynamic> questions = [];

  Future<void> fetchData() async {
    final response = await ApiService.get('quiz');
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        questions = jsonData['quizzes'][0]['questions'];
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void checkAnswer(String answer, bool correct) {
    setState(() {
      selectedAnswer = answer;
      isAnswered = true;
      isCorrect = correct;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = '';
        isAnswered = false;

        if (currentQuestionIndex >= questions.length) {
          showSuccessPopup(context);
          currentQuestionIndex = 0; // Reset le quiz après la fin
        }
      });
    });
  }

  void showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'BRAVO',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 50.0,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24.0),
                SvgPicture.asset(
                  'assets/images/check.svg',
                  width: 160,
                  height: 160,
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/star.svg',
                      width: 40,
                      height: 40,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFFFE55A),
                        BlendMode.srcIn,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/star.svg',
                      width: 65,
                      height: 65,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFFFE55A),
                        BlendMode.srcIn,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/star.svg',
                      width: 40,
                      height: 40,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF353535),
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Vous avez gagné 80 points',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 50.0),
                CustomButton(
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.textPrimary,
                  text: 'Prochaine étape',
                  fontFamily: 'BebasNeue',
                  padding: 30,
                  borderRadius: 0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16.0),
                CustomButton(
                  backgroundColor: AppColors.cardBackground,
                  textColor: AppColors.textPrimary,
                  text: 'Jouer à nouveau',
                  fontFamily: 'BebasNeue',
                  padding: 30,
                  borderRadius: 0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.5, -0.1),
              end: Alignment(0.5, 0.1),
              colors: [AppColors.primary, AppColors.background],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => {
                      checkAnswer('', false),
                    },
                    child: const Icon(
                      Icons.chevron_left_outlined,
                      color: AppColors.textPrimary,
                      size: 25,
                    ),
                  ),
                  Text(
                    '${currentQuestionIndex + 1} / ${questions.length}',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 28,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      checkAnswer('', false),
                    },
                    child: const Icon(
                      Icons.chevron_right_outlined,
                      color: AppColors.textPrimary,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                question["question"],
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 25,
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.asset(question["image"], fit: BoxFit.cover),
              const SizedBox(height: 20),
              ...question["options"].asMap().entries.map((entry) {
                final index = entry.key as int;
                final answer = entry.value;
                final letter = String.fromCharCode(65 + index); // A, B, C, etc.

                final isSelected = selectedAnswer == answer["text"];
                Color buttonColor = const Color(0xFF323232);

                if (isAnswered && isSelected) {
                  buttonColor =
                      isCorrect ? AppColors.primary : AppColors.alertRed;
                }

                return GestureDetector(
                  onTap: () => isAnswered
                      ? null
                      : checkAnswer(answer["text"], answer["isCorrect"]),
                  child: Container(
                    width: 340,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: ShapeDecoration(
                      color: buttonColor,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1, color: AppColors.greyBackground),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: buttonColor,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: AppColors.greyBackground),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              letter,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 24,
                                fontFamily: 'BebasNeue',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: Text(
                            answer["text"] ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 16,
                              fontFamily: 'Manrope',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
