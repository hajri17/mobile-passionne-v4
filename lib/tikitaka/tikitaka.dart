import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/tikitaka/add-player.dart';
import 'package:passione_app/tikitaka/create-team.dart';
import 'package:passione_app/tikitaka/profil-player.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class TikitakaPage extends StatefulWidget {
  const TikitakaPage({super.key});

  @override
  State<TikitakaPage> createState() => _TikitakaPageState();
}

class _TikitakaPageState extends State<TikitakaPage> {
  String selectedJournee = 'Journée 1';
  List<dynamic> pickteam = [];

  final List<String> journees = List.generate(
    36,
    (index) => 'Journée ${index + 1}',
  );

  Future<void> checkIfPickTeamExiste() async {
    try {
      // var responseRound = await ApiService.get('fixture/next-round');
      // final dataRound = json.decode(responseRound.body);
      // selectedJournee = dataRound['round'];

      String? userId = await ApiService.getDataFromShared('connected_id');
      var response = await ApiService.get('pickteam/$userId/$selectedJournee');
      final jsonData = json.decode(response.body);
      setState(() {
        pickteam = jsonData['data']['players'];
      });

      if (userId == null && response.statusCode != 200) {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CreateTeamScreen();
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

  List<dynamic> getSubstitutes(List<dynamic> players) {
    return players.where((player) => player['isSubstituted'] == true).toList();
  }

  List<dynamic> getActivePlayers(List<dynamic> players) {
    return players.where((player) => player['isSubstituted'] == false).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> substitutes = getSubstitutes(pickteam);
    List<dynamic> activePlayers = getActivePlayers(pickteam);
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'VOTRE ÉQUIPE',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                  Text(
                    "$selectedJournee deadline:",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                  const Row(
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
                                  p['player']['position'] == "Goalkeeper")
                              .toList(),
                        ),
                        _buildSoccerRow(
                          activePlayers
                              .where(
                                  (p) => p['player']['position'] == "Defender")
                              .toList(),
                        ),
                        _buildSoccerRow(
                          activePlayers
                              .where((p) =>
                                  p['player']['position'] == "Midfielder")
                              .toList(),
                        ),
                        _buildSoccerRow(
                          activePlayers
                              .where(
                                  (p) => p['player']['position'] == "Attacker")
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

  Widget _buildSoccerRow(List<dynamic> players) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: players.map((player) {
        return GestureDetector(
          onTap: () => _showPlayerOptions(context, player['player']),
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
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          '${ApiService.baseUrlImg}/${player['player']['logo']}',
                        ),
                      ),
                    ),
                    if (player["captain"])
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/captain.png',
                          width: 25,
                        ),
                      )
                    else if (player["isInjured"])
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/uncertain.png',
                          width: 25,
                        ),
                      )
                    else if (player["mvp"])
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/mvp.png',
                          width: 25,
                        ),
                      )
                    else if (player["vicecaptain"])
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/vice.png',
                          width: 25,
                        ),
                      )
                    else if (player["redCard"])
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
                      player['player']["number"].toString(),
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
                      player['player']["name"],
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
                      position: playerDetails['position'],
                      selecterPlayerList: const {},
                    ),
                  ),
                );
              }),
              const Divider(height: 0),
              _menuOption("assets/images/captain1.png", "Rôle du Joueur", () {
                Navigator.pop(context);
                _showCaptainAndViceCaptain(context, playerDetails['_id']);
              }),
              const Divider(height: 0),
              _menuOption("assets/images/profile.png", "Profile du Joueur", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerProfilePage(
                      playerId: playerDetails["_id"],
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
                  backgroundColor: const Color(0xFFD6D5D5),
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

  void _showCaptainAndViceCaptain(BuildContext context, playerDetailId) {
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
              _menuOption("assets/images/captain.png", "CAPITANO", () async {
                String? userId =
                    await ApiService.getDataFromShared('connected_id');
                Map<String, dynamic> requestBody = {
                  "playerId": playerDetailId,
                  "round": selectedJournee,
                };

                final response = await ApiService.update(
                    'pickteam/captain/$userId', requestBody);
                print('response.body : ${response.body}');

                // Navigator.pop(context);
              }),
              const Divider(height: 0),
              _menuOption("assets/images/vice.png", "DEUXIEME CAPITANO",
                  () async {
                String? userId =
                    await ApiService.getDataFromShared('connected_id');
                Map<String, dynamic> requestBody = {
                  "playerId": playerDetailId,
                  "round": selectedJournee,
                };

                final response = await ApiService.update(
                    'pickteam/vice-captain/$userId', requestBody);
                print('response.body : ${response.body}');

                // Navigator.pop(context);
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
            List<dynamic> substitutes = getSubstitutes(pickteam);
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
                    height: 240,
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
                                    context, player['player'], playerDetails);
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
                                CustomText(
                                    text: "${player['player']["number"]}"),
                                SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  '${ApiService.baseUrlImg}/${player['player']['logo']}'),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Image.network(
                                              '${ApiService.baseUrlImg}/${player['player']["team"]['logo']}',
                                              fit: BoxFit.cover,
                                              width: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 5),
                                      Flexible(
                                        child: Text(
                                          player['player']["name"],
                                          style: const TextStyle(
                                            color: AppColors.textPrimary,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomText(text: "${player['player']["age"]}"),
                                CustomText(text: "${player['player']["age"]}"),
                                CustomText(text: "${player['player']["age"]}"),
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
      Map<String, dynamic> newPlayer, Map<String, dynamic> oldPlayer) {
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
                          backgroundImage: NetworkImage(
                              '${ApiService.baseUrlImg}/${oldPlayer['logo']}'),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.arrow_downward,
                          size: 50,
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
                          backgroundImage: NetworkImage(
                              '${ApiService.baseUrlImg}/${newPlayer['logo']}'),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.arrow_upward,
                          size: 50,
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

                      Map<String, dynamic> requestBody = {
                        "playerToBeTransfert": oldPlayer['_id'],
                        "newPlayerId": newPlayer['_id'],
                      };

                      print('requestBody 1: $requestBody');
                      try {
                        final response = await ApiService.update(
                            'pickteam/transfer/$userId', requestBody);
                        print('requestBody: ${response.body}');

                        if (response.statusCode == 200) {
                          print('Players saved successfully!');
                          if (!mounted) return;
                          showSuccessPopup(context);
                        } else {
                          print('Failed to save players: ${response.body}');
                        }
                      } catch (e) {
                        print('Error saving players: $e');
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
