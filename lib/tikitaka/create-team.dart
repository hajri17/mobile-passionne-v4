import 'package:flutter/material.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/tikitaka/add-player.dart';
import 'package:passione_app/tikitaka/team-data.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class CreateTeamScreen extends StatefulWidget {
  final Map<String, dynamic> player;
  final int rowIndex;
  final int columnIndex;

  const CreateTeamScreen({
    super.key,
    required this.player,
    required this.rowIndex,
    required this.columnIndex,
  });

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  List<Map<String, String>> playerList = [
    {"id": "1", "image": "assets/images/player_avatar.png"},
    {"id": "2", "image": "assets/images/player_avatar.png"},
    {"id": "3", "image": "assets/images/player_avatar.png"},
  ];

  @override
  void initState() {
    super.initState();
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
                "VOUS AVEZ CRÉÉ VOTRE ÉQUIPE",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              'CRÉER VOTRE ÉQUIPE',
              "Protecteur ultime du but. Sa principale responsabilité est d'empêcher le ballon de pénétrer dans les filets.",
            ),
            // Container(
            //   height: 260,
            //   padding: const EdgeInsets.all(16),
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topRight,
            //       end: Alignment.bottomRight,
            //       colors: [Color(0xFF629F3F), Color(0xFF121212)],
            //     ),
            //   ),
            //   child: const Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text(
            //         'CRÉER VOTRE ÉQUIPE',
            //         style: TextStyle(
            //           color: AppColors.textPrimary,
            //           fontSize: 40,
            //           fontWeight: FontWeight.bold,
            //           fontFamily: 'BebasNeue',
            //         ),
            //       ),
            //       Text(
            //         "Protecteur ultime du but. Sa principale responsabilité est d'empêcher le ballon de pénétrer dans les filets.",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: AppColors.textSecondary,
            //           fontSize: 10,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
                    child: Column(
                      children: [
                        Text(
                          'ÉQUIPE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Sélectionnez les joueurs appropriés',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 10,
                          ),
                        ),
                      ],
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
                        _buildSoccerRow(['GB'], 0),
                        _buildSoccerRow(['DF', 'DF', 'DF', 'DF'], 1),
                        _buildSoccerRow(['ML', 'ML', 'ML', 'ML'], 2),
                        _buildSoccerRow(['AT', 'AT'], 3),
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
                  const SizedBox(height: 4),
                  const Text(
                    'Choisissez vos remplacants',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSoccerRow(['GB', 'DF', 'ML', 'AT'], 4),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    TeamData().removeAllPlayer();
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.textPrimary,
                    minimumSize: const Size(0, 48),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text(
                    'REINITIALISER',
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 17,
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
                      } else {
                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            margin: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            behavior: SnackBarBehavior.floating,
                            content: const Text(
                              "Veuillez d'abord sélectionner tous les joueurs",
                            ),
                            backgroundColor: AppColors.alertRed,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size(double.infinity, 48),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text(
                      'SAUVEGARDER MON EQUIPE',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 17,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSoccerRow(List<String> positions, int rowIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        positions.length,
        (columnIndex) {
          String positionKey = '$rowIndex-$columnIndex';
          List<String> players = TeamData().getPlayers(positionKey);

          Map<String, dynamic>? playerDetails;
          if (players.isNotEmpty) {
            playerDetails = TeamData().getPlayerDetails(players.first);
          }

          return SizedBox(
            width: 75,
            height: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPlayersScreen(
                          columnIndex: columnIndex,
                          rowIndex: rowIndex,
                        ),
                      ),
                    );
                  },
                  child: players.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                playerDetails?["image"],
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(16),
                          decoration:
                              const BoxDecoration(color: Color(0xFF353535)),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.textPrimary,
                            size: 18,
                          ),
                        ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Jersey Number
                    Container(
                      width: 20,
                      height: 25,
                      padding: const EdgeInsets.only(top: 5),
                      decoration: const BoxDecoration(color: AppColors.primary),
                      child: players.isNotEmpty
                          ? Text(
                              playerDetails?["id"],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFEDEDED),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BebasNeue',
                              ),
                            )
                          : Text(
                              '0${columnIndex + 1}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFEDEDED),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BebasNeue',
                              ),
                            ),
                    ),
                    // Player Name or Position
                    Container(
                      width: 55,
                      height: 25,
                      padding: const EdgeInsets.only(top: 5),
                      decoration:
                          const BoxDecoration(color: AppColors.textPrimary),
                      child: players.isNotEmpty
                          ? Text(
                              playerDetails?["name"],
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF141414),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BebasNeue',
                              ),
                            )
                          : Text(
                              positions[columnIndex],
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
        },
      ),
    );
  }
}
