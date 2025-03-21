import 'package:flutter/material.dart';
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

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Quel est le du CSS ?",
      "image": "assets/images/jmal.png",
      "answers": [
        {"index": "A", "text": "Stade Taïeb-Mehiri", "correct": true},
        {"index": "B", "text": "Stade Olympique De Beja", "correct": false},
        {"index": "C", "text": "Stade Mehri El Akermi", "correct": false},
        {"index": "D", "text": "Stade Mokhtar El Far", "correct": false},
      ]
    },
    {
      "question":
          "Quel est le nom du stade associé au club de football du CSS ?",
      "image": "assets/images/jmal.png",
      "answers": [
        {"index": "A", "text": "Stade Taïeb-Mehiri", "correct": true},
        {"index": "B", "text": "Stade Olympique De Beja", "correct": false},
        {"index": "C", "text": "Stade Mehri El Akermi", "correct": false},
        {"index": "D", "text": "Stade Mokhtar El Far", "correct": false},
      ]
    }
  ];

  void checkAnswer(String answer, bool correct) {
    setState(() {
      selectedAnswer = answer;
      isAnswered = true;
      isCorrect = correct;
      showSuccessPopup(context);
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = '';
        isAnswered = false;
        if (currentQuestionIndex >= questions.length) {
          currentQuestionIndex = 0;
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
                  'BON TRAVAIL',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 50.0,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  width: 144.35,
                  height: 144.35,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 144.35,
                          height: 144.35,
                          decoration: ShapeDecoration(
                            color: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1.20,
                                color: AppColors.textPrimary,
                              ),
                              borderRadius: BorderRadius.circular(144.35),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25.26,
                        top: 25.26,
                        child: Container(
                          width: 93.83,
                          height: 93.83,
                          decoration: ShapeDecoration(
                            color: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1.20,
                                color: AppColors.textPrimary,
                              ),
                              borderRadius: BorderRadius.circular(144.35),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0xFF273121),
                                blurRadius: 38.49,
                                offset: Offset(0, 19.25),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.check_rounded,
                            color: AppColors.textPrimary,
                            size: 50.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                      size: 40.0,
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                      size: 80.0,
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.grey,
                      size: 40.0,
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
              ...question["answers"].map((answer) {
                bool isSelected = selectedAnswer == answer["text"];
                Color buttonColor = AppColors.cardBackground;

                if (isAnswered && isSelected) {
                  buttonColor =
                      isCorrect ? AppColors.primary : AppColors.alertRed;
                }

                return GestureDetector(
                  onTap: () => isAnswered
                      ? null
                      : checkAnswer(answer["text"], answer["correct"]),
                  child: Container(
                    width: 340,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 7,
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: ShapeDecoration(
                      color: buttonColor,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: AppColors.greyBackground,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          child: Text(
                            answer["index"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 24,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: Text(
                            answer["text"],
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
