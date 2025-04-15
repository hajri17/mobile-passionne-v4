import 'package:flutter/material.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/tikitaka/add-player.dart';
import 'package:passione_app/tikitaka/tikitaka.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({
    super.key,
  });

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  Map<String, Map<String, dynamic>> selectedPlayers = {};

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TikitakaPage(),
                    ),
                  );
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
                    selectedPlayers.clear();
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
                      String selectedJournee = 'Journée 1';

                      // String? selectedJournee = await ApiService.getDataFromShared('round');

                      if (userId == null) {
                        return;
                      }

                      Map<String, dynamic> requestBody = {
                        "points": 100,
                        "round": selectedJournee,
                        "userId": userId,
                        "players": selectedPlayers.values
                            .map((p) => {
                                  "player": p['_id'],
                                  "rowIndex": p['rowIndex'],
                                  "columnIndex": p['columnIndex'],
                                  "isSubstituted": p['rowIndex'] >= 4,
                                })
                            .toList(),
                      };

                      if (selectedPlayers.length == 15) {
                        try {
                          final response =
                              await ApiService.post('pickteam', requestBody);

                          if (response.statusCode == 201) {
                            if (!mounted) return;
                            showSuccessPopup(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                margin: const EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                behavior: SnackBarBehavior.floating,
                                content: const Text(
                                  "Erruer lors d'enregistrement d'equipe",
                                ),
                                backgroundColor: AppColors.alertRed,
                              ),
                            );
                          }
                        } catch (e) {
                          print('Error saving players: $e');

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              margin: const EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              behavior: SnackBarBehavior.floating,
                              content: const Text(
                                "Erruer lors serveur",
                              ),
                              backgroundColor: AppColors.alertRed,
                            ),
                          );
                        }
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
          String key = '$rowIndex-$columnIndex';
          Map<String, dynamic>? selectedPlayer = selectedPlayers[key];

          String position = positions[columnIndex]; // Get position from list

          return GestureDetector(
            onTap: () async {
              final selected = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPlayersScreen(
                    rowIndex: rowIndex,
                    columnIndex: columnIndex,
                    position: position,
                    selecterPlayerList: selectedPlayers,
                  ),
                ),
              );

              if (selected != null) {
                setState(() {
                  selectedPlayers[key] = selectedPlayers[key] = {
                    ...selected,
                    'rowIndex': rowIndex,
                    'columnIndex': columnIndex,
                  };
                });
              }
            },
            child: selectedPlayer != null
                ? SizedBox(
                    width: 75,
                    height: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              '${ApiService.baseUrlImg}/${selectedPlayer["logo"]}',
                            ),
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
                              decoration:
                                  const BoxDecoration(color: AppColors.primary),
                              child: Text(
                                selectedPlayer["number"].toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFFEDEDED),
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
                              decoration: const BoxDecoration(
                                  color: AppColors.textPrimary),
                              child: Text(
                                selectedPlayer["name"],
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
                  )
                : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration:
                            const BoxDecoration(color: Color(0xFF353535)),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.textPrimary,
                          size: 18,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 25,
                            padding: const EdgeInsets.only(top: 5),
                            decoration:
                                const BoxDecoration(color: AppColors.primary),
                            child: Text(
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
                          Container(
                            width: 50,
                            height: 25,
                            padding: const EdgeInsets.only(top: 5),
                            decoration: const BoxDecoration(
                                color: AppColors.textPrimary),
                            child: Text(
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
