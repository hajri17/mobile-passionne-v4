import 'package:flutter/material.dart';
import 'package:passione_app/tikitaka/profil-player.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class LeaderboardDetailPage extends StatefulWidget {
  final String playerId;

  const LeaderboardDetailPage({super.key, required this.playerId});

  @override
  State<LeaderboardDetailPage> createState() => _LeaderboardDetailPageState();
}

class _LeaderboardDetailPageState extends State<LeaderboardDetailPage> {
  String selectedJournee = 'Journée 1';

  final List<String> journees = List.generate(
    36,
    (index) => 'Journée ${index + 1}',
  );

  List<Map<String, dynamic>> players = [
    // Goalkeeper
    {
      "player_id": 1,
      "isSubstituted": false,
      "player_details": {
        "id": "1",
        "image": "assets/images/player_avatar.png",
        "name": "Goalkeeper 1",
        "position": "GK",
        "price": 5,
        "points": 90,
      },
    },

    // Defenders
    {
      "player_id": 2,
      "isSubstituted": false,
      "player_details": {
        "id": "2",
        "image": "assets/images/player_avatar.png",
        "name": "Defender 1",
        "position": "DF",
        "price": 7,
        "points": 120,
      },
    },
    {
      "player_id": 3,
      "isSubstituted": false,
      "player_details": {
        "id": "3",
        "image": "assets/images/player_avatar.png",
        "name": "Defender 2",
        "position": "DF",
        "price": 6,
        "points": 100,
      },
    },
    {
      "player_id": 4,
      "isSubstituted": false,
      "player_details": {
        "id": "4",
        "image": "assets/images/player_avatar.png",
        "name": "Defender 3",
        "position": "DF",
        "price": 6,
        "points": 95,
      },
    },
    {
      "player_id": 5,
      "isSubstituted": false,
      "player_details": {
        "id": "5",
        "image": "assets/images/player_avatar.png",
        "name": "Defender 4",
        "position": "DF",
        "price": 5,
        "points": 85,
      },
    },

    // Midfielders
    {
      "player_id": 6,
      "isSubstituted": false,
      "player_details": {
        "id": "6",
        "image": "assets/images/player_avatar.png",
        "name": "Midfielder 1",
        "position": "MF",
        "price": 8,
        "points": 140,
      },
    },
    {
      "player_id": 7,
      "isSubstituted": false,
      "player_details": {
        "id": "7",
        "image": "assets/images/player_avatar.png",
        "name": "Midfielder 2",
        "position": "MF",
        "price": 7,
        "points": 130,
      },
    },
    {
      "player_id": 8,
      "isSubstituted": false,
      "player_details": {
        "id": "8",
        "image": "assets/images/player_avatar.png",
        "name": "Midfielder 3",
        "position": "MF",
        "price": 6,
        "points": 110,
      },
    },
    {
      "player_id": 9,
      "isSubstituted": false,
      "player_details": {
        "id": "9",
        "image": "assets/images/player_avatar.png",
        "name": "Midfielder 4",
        "position": "MF",
        "price": 5,
        "points": 100,
      },
    },

    // Attackers
    {
      "player_id": 10,
      "isSubstituted": false,
      "player_details": {
        "id": "10",
        "image": "assets/images/player_avatar.png",
        "name": "Forward 1",
        "position": "FW",
        "price": 9,
        "points": 200,
      },
    },
    {
      "player_id": 11,
      "isSubstituted": false,
      "player_details": {
        "id": "11",
        "image": "assets/images/player_avatar.png",
        "name": "Forward 2",
        "position": "FW",
        "price": 8,
        "points": 180,
      },
    },
  ];

  List<Map<String, dynamic>> getPlayersByPosition(String position) {
    return players.where((p) {
      final details = p['player_details'];
      return details != null && details['position'] == position;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cardBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Détails du profil",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontFamily: 'BebasNeue',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              'Profile',
              "",
            ),
            Container(
              color: AppColors.cardBackground,
              margin: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.network(
                    'https://storage.googleapis.com/a1aa/image/RnYoX0UAk2iKLt0IZEF0yfGDnkdL3zWUnCV3aySeU3s.jpg',
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FOULEN FOULENI',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          fontFamily: 'BebasNeue',
                        ),
                      ),
                      Text(
                        'Classement : 12',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontFamily: 'BebasNeue',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    value: selectedJournee,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedJournee = newValue!;
                      });
                    },
                    items:
                        journees.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 10,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const Column(
                    children: [
                      Text(
                        '100',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          fontFamily: 'BebasNeue',
                          height: 1,
                        ),
                      ),
                      Text(
                        'Points',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Container(
                    height: 500,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/stadeImg.png"),
                        fit: BoxFit.fill,
                      ),
                      color: AppColors.cardBackground,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSoccerRow(context, getPlayersByPosition("GK")),
                        _buildSoccerRow(context, getPlayersByPosition("DF")),
                        _buildSoccerRow(context, getPlayersByPosition("MF")),
                        _buildSoccerRow(context, getPlayersByPosition("FW")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSoccerRow(context, List<Map<String, dynamic>> players) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: players.map((player) {
      Map<String, dynamic> playerDetails = player['player_details'];

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PlayerProfilePage(
                playerId: "1",
              ),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    playerDetails["image"],
                    width: 50,
                    height: 50,
                  ),
                  if (playerDetails["id"] == "1")
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/captain.png',
                        width: 25,
                      ),
                    )
                  else if (playerDetails["id"] == "2")
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/uncertain.png',
                        width: 25,
                      ),
                    )
                  else if (playerDetails["id"] == "3")
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/mvp.png',
                        width: 25,
                      ),
                    )
                  else if (playerDetails["id"] == "4")
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/vice.png',
                        width: 25,
                      ),
                    )
                  else if (playerDetails["id"] == "5")
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/will-not-play.png',
                        width: 25,
                      ),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 25,
                  padding: const EdgeInsets.only(top: 5),
                  decoration: const BoxDecoration(color: AppColors.primary),
                  child: Text(
                    playerDetails["id"],
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
                Container(
                  width: 55,
                  height: 25,
                  padding: const EdgeInsets.only(top: 5),
                  decoration: const BoxDecoration(color: AppColors.textPrimary),
                  child: Text(
                    playerDetails["name"],
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF141414),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList(),
  );
}
