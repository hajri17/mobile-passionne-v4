import 'package:flutter/material.dart';
import 'package:passione_app/tikitaka/leaderboard-detail.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  String selectedDay = 'JOURNÉE 1';

  final List<String> days = List.generate(
    36,
    (index) => 'JOURNÉE ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              'Classement',
              "Protecteur ultime du but. Sa principale responsabilité est d'empêcher le ballon de pénétrer dans les filets.",
            ),
            Container(
              color: Colors.grey[900],
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedDay,
                        icon: const Icon(
                          Icons.expand_more,
                          color: Colors.white,
                        ),
                        dropdownColor: AppColors.primary,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                        items: days.map((String day) {
                          return DropdownMenuItem<String>(
                            value: day,
                            child: Text(day),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedDay = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      buildTopThreeItem(
                        '01',
                        'FOULEN FOULENI',
                        '120 PTS',
                        Color(0xFFD9C253),
                      ),
                      buildTopThreeItem(
                        '02',
                        'FOULEN FOULENI',
                        '120 PTS',
                        Color(0xFF848181),
                      ),
                      buildTopThreeItem(
                        '03',
                        'FOULEN FOULENI',
                        '120 PTS',
                        Color(0xFFA3522A),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(5, (index) {
                      return buildOtherRankingItem(
                        index + 4,
                        'Darcie Brown',
                        '32',
                        '120',
                        '120',
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopThreeItem(
      String rank, String name, String points, Color color) {
    return Container(
      color: AppColors.background,
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 75,
            color: color,
            child: Text(
              rank,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/images/player_avatar.png',
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'BebasNeue',
                    height: 1,
                  ),
                ),
                Text(
                  points,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontFamily: 'BebasNeue',
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const LeaderboardDetailPage(playerId: "1"),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 21),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(0),
              ),
              child: const Icon(Icons.remove_red_eye, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOtherRankingItem(
      int rank, String name, String score1, String score2, String score3) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: rank.toString()),
          SizedBox(
            width: 100,
            child: Row(
              children: [
                const SizedBox(
                  height: 35,
                  width: 35,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/player_avatar.png'),
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomText(text: score1.toString()),
          CustomText(text: score2.toString()),
          CustomText(text: score3.toString()),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LeaderboardDetailPage(
                    playerId: "1",
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(0),
              ),
              child: const Icon(Icons.remove_red_eye, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
