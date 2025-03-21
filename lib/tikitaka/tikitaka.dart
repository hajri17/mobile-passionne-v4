import 'package:flutter/material.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/tikitaka/add-player.dart';
import 'package:passione_app/tikitaka/create-team.dart';
import 'package:passione_app/tikitaka/profil-player.dart';
import 'package:passione_app/tikitaka/team-data.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class TikitakaPage extends StatefulWidget {
  const TikitakaPage({super.key});

  @override
  State<TikitakaPage> createState() => _TikitakaPageState();
}

class _TikitakaPageState extends State<TikitakaPage> {
  String selectedJournee = 'Journée 1';

  List<Map<String, dynamic>> pickteam = [
    {
      "user_id": "67caee189cf55debab2db9a0",
      "players": [
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

        // Substitutes
        {
          "player_id": 12,
          "isSubstituted": true,
          "player_details": {
            "id": "12",
            "image": "assets/images/player_avatar.png",
            "name": "Sub GK",
            "position": "GK",
            "price": 4,
            "points": 80,
          },
        },
        {
          "player_id": 13,
          "isSubstituted": true,
          "player_details": {
            "id": "13",
            "image": "assets/images/player_avatar.png",
            "name": "Sub DF",
            "position": "DF",
            "price": 5,
            "points": 90,
          },
        },
        {
          "player_id": 14,
          "isSubstituted": true,
          "player_details": {
            "id": "14",
            "image": "assets/images/player_avatar.png",
            "name": "Sub MF",
            "position": "MF",
            "price": 6,
            "points": 100,
          },
        },
        {
          "player_id": 15,
          "isSubstituted": true,
          "player_details": {
            "id": "15",
            "image": "assets/images/player_avatar.png",
            "name": "Sub FW",
            "position": "FW",
            "price": 7,
            "points": 110,
          },
        },
      ]
    }
  ];

  final List<String> journees = List.generate(
    36,
    (index) => 'Journée ${index + 1}',
  );

  Future<void> checkIfPickTeamExiste() async {
    try {
      String? userId = await ApiService.getDataFromShared('userId');
      if (userId == null) {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CreateTeamScreen(
              player: {},
              rowIndex: 0,
              columnIndex: 0,
            );
          },
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfPickTeamExiste();
  }

  List<Map<String, dynamic>> getSubstitutes(
      List<Map<String, dynamic>> players) {
    return players.where((player) => player['isSubstituted'] == true).toList();
  }

  List<Map<String, dynamic>> getActivePlayers(
      List<Map<String, dynamic>> players) {
    return players.where((player) => player['isSubstituted'] == false).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> players = pickteam[0]["players"];
    List<Map<String, dynamic>> substitutes = getSubstitutes(players);
    List<Map<String, dynamic>> activePlayers = getActivePlayers(players);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF629F3F), Color(0xFF121212)],
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'VOTRE ÉQUIPE',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                  Text(
                    "Journée 1 deadline:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '00',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 48,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Jours',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 12,
                              height: 0.1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Text(
                        ':',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 48,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '00',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 48,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Heures',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              height: 0.1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Text(
                        ':',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 48,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '00',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 48,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Mins',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              height: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Moyen',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 10,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '99',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 25,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Points',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 10,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                          height: 0.1,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '999',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 60,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      Text(
                        'Points',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                          height: 0.1,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Max',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 10,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '99',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 25,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Points',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 10,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                          height: .1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const SizedBox(width: 8),
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
                  const Spacer(),
                  const Column(
                    children: [
                      Text(
                        'Classement',
                        style: TextStyle(
                          color: Color(0xFFFAFAFA),
                          fontSize: 8,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '1er / 32541',
                        style: TextStyle(
                          color: Color(0xFFFAFAFA),
                          fontSize: 10,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                color: AppColors.cardBackground,
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'ÉQUIPE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
                        _buildSoccerRow(
                          activePlayers
                              .where((p) =>
                                  p['player_details']['position'] == "GK")
                              .toList(),
                        ),
                        _buildSoccerRow(
                          activePlayers
                              .where((p) =>
                                  p['player_details']['position'] == "DF")
                              .toList(),
                        ),
                        _buildSoccerRow(
                          activePlayers
                              .where((p) =>
                                  p['player_details']['position'] == "MF")
                              .toList(),
                        ),
                        _buildSoccerRow(
                          activePlayers
                              .where((p) =>
                                  p['player_details']['position'] == "FW")
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(top: 16, bottom: 10),
              decoration: const BoxDecoration(
                color: AppColors.cardBackground,
              ),
              child: Column(
                children: [
                  const Text(
                    'REMPLACANTS',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSoccerRow(substitutes),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildSoccerRow(List<Map<String, dynamic>> players) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: players.map((player) {
        Map<String, dynamic> playerDetails = player['player_details'];

        return GestureDetector(
          onTap: () => _showPlayerOptions(context, playerDetails),
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
                    decoration:
                        const BoxDecoration(color: AppColors.textPrimary),
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

  void _showPlayerOptions(
      BuildContext context, Map<String, dynamic> playerDetails) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _menuOption("assets/images/change.png", "Changer le Joueur", () {
                Navigator.pop(context);
                _showSubstitutesList(context, playerDetails);
              }),
              const Divider(height: 0),
              _menuOption("assets/images/transfert.png", "Transférer", () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPlayersScreen(
                      columnIndex: 4,
                      rowIndex: 5,
                    ),
                  ),
                );
              }),
              const Divider(height: 0),
              _menuOption("assets/images/captain1.png", "Rôle du Joueur", () {
                Navigator.pop(context);
                _showCaptainAndViceCaptain(context);
              }),
              const Divider(height: 0),
              _menuOption("assets/images/profile.png", "Profile du Joueur", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerProfilePage(
                      playerId: playerDetails["id"],
                    ),
                  ),
                );
              }),
            ],
          ),
          actionsPadding: EdgeInsets.zero,
          actions: [
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFD6D5D5),
                  minimumSize: const Size(
                    double.infinity,
                    48,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'Retour',
                  style: TextStyle(
                    color: AppColors.background,
                    fontSize: 20,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCaptainAndViceCaptain(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _menuOption("assets/images/captain.png", "CAPITANO", () {
                Navigator.pop(context);
              }),
              const Divider(height: 0),
              _menuOption("assets/images/vice.png", "DEUXIEME CAPITANO", () {
                Navigator.pop(context);
              }),
            ],
          ),
          actionsPadding: EdgeInsets.zero,
          actions: [
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.textPrimary,
                  minimumSize: const Size(
                    double.infinity,
                    48,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'Retour',
                  style: TextStyle(
                    color: AppColors.background,
                    fontSize: 20,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _menuOption(String image, String text, VoidCallback onTap) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 25,
        height: 25,
      ),
      title: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'BebasNeue',
            fontWeight: FontWeight.bold,
            height: .1),
      ),
      onTap: onTap,
    );
  }

  void _showSubstitutesList(
      BuildContext context, Map<String, dynamic> playerDetails) {
    int? selectedSubstitutesIndex;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            List<Map<String, dynamic>> substitutes = [
              {
                "name": "Player 1",
                "image": "assets/images/player_avatar.png",
                "id": 1,
                "a": 1,
                "p": 1,
                "s": 1
              },
              {
                "name": "Annabel Land",
                "image": "assets/images/player_avatar.png",
                "id": 2,
                "a": 1,
                "p": 1,
                "s": 1
              },
              {
                "name": "Player 3",
                "image": "assets/images/player_avatar.png",
                "id": 3,
                "a": 1,
                "p": 1,
                "s": 1
              },
              {
                "name": "Player 4",
                "image": "assets/images/player_avatar.png",
                "id": 4,
                "a": 1,
                "p": 1,
                "s": 1
              },
            ];

            return AlertDialog(
              backgroundColor: AppColors.cardBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 23,
                          bottom: 18,
                          left: 15,
                        ),
                        child: const Text(
                          "Joueurs Remplaçants",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                            color: AppColors.textPrimary,
                            height: .1,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.textPrimary,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const Divider(height: 0),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white12,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText(text: "C"),
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Nom",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        CustomText(text: "A"),
                        CustomText(text: "P"),
                        CustomText(text: "S"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      itemCount: substitutes.length,
                      itemBuilder: (context, index) {
                        final player = substitutes[index];
                        final isSelected = selectedSubstitutesIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSubstitutesIndex = index;
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                // Navigator.pop(context);
                                _showConfirmationDialog(
                                    context, playerDetails, player);
                              });
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.transparent,
                              border: const Border(
                                bottom: BorderSide(
                                  color: AppColors.cardBackground,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: "${index + 1}"),
                                SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            height: 35,
                                            width: 35,
                                            child: CircleAvatar(
                                              backgroundImage:
                                                  AssetImage(player["image"]),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Image.asset(
                                              'assets/images/ess_logo.png',
                                              fit: BoxFit.cover,
                                              width: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 5),
                                      Flexible(
                                        child: Text(
                                          player["name"],
                                          style: const TextStyle(
                                            color: AppColors.textPrimary,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomText(text: "${player["a"]}"),
                                CustomText(text: "${player["p"]}"),
                                CustomText(text: "${player["s"]}"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              actionsPadding: EdgeInsets.zero,
              actions: [
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showPlayerOptions(context, playerDetails);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.textPrimary,
                      minimumSize: const Size(
                        double.infinity,
                        48,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Retour',
                      style: TextStyle(
                        color: AppColors.background,
                        fontSize: 20,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context,
      Map<String, dynamic> oldPlayer, Map<String, dynamic> newPlayer) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 23.0, bottom: 18),
                    child: const Text(
                      "Changement de Joueur",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BebasNeue',
                        color: AppColors.textPrimary,
                        height: .1,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Divider(height: 0),
              const SizedBox(height: 50),
              const Text(
                "Confirmez-vous le changement ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontFamily: "BebasNeue",
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 75,
                        width: 75,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(oldPlayer["image"]),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.arrow_downward,
                          size: 25,
                          color: AppColors.alertRed,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Par',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 75,
                        width: 75,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(newPlayer["image"]),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.arrow_upward,
                          size: 25,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
          actionsPadding: EdgeInsets.zero,
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.textPrimary,
                    minimumSize: const Size(0, 48),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Retour',
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      String? userId =
                          await ApiService.getDataFromShared('connected_id');

                      if (userId == null) {
                        return;
                      }

                      List<String> playersList = TeamData()
                          .selectedPlayers
                          .values
                          .expand(
                              (players) => players.map((playerId) => playerId))
                          .toList();

                      Map<String, dynamic> requestBody = {
                        "points": 100,
                        "round": "Journée 1",
                        "user_id": userId,
                        "players": playersList,
                      };
                      showSuccessPopup(context);

                      print('requestBody: $requestBody');
                      if (TeamData().getTotalPlayersCount() == 15) {
                        // try {
                        //   final response =
                        //       await ApiService.post('/save-team', requestBody);

                        //   if (response.statusCode == 200) {
                        //     print('Players saved successfully!');
                        //     if (!mounted) return;
                        //     showSuccessPopup(context);
                        //   } else {
                        //     print('Failed to save players: ${response.body}');
                        //   }
                        // } catch (e) {
                        //   print('Error saving players: $e');
                        // }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size(double.infinity, 48),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                    ),
                    child: const Text(
                      'COMFIRMER',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 20,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 100,
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "FÉLICITATIONS",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  fontFamily: 'BebasNeue',
                ),
              ),
              Text(
                "Vous avez changé votre joueur",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontFamily: 'BebasNeue',
                ),
              ),
            ],
          ),
          actionsPadding: EdgeInsets.zero,
          actions: [
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.textPrimary,
                  minimumSize: const Size(
                    double.infinity,
                    48,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'ACCEUIL TIKITAKA',
                  style: TextStyle(
                    color: AppColors.background,
                    fontSize: 20,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
