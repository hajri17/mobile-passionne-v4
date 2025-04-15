import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/tikitaka/profil-player.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class AddPlayersScreen extends StatefulWidget {
  final int columnIndex;
  final int rowIndex;
  final Map<String, Map<String, dynamic>> selecterPlayerList;

  final String position;
  const AddPlayersScreen({
    super.key,
    required this.columnIndex,
    required this.rowIndex,
    required this.position,
    required this.selecterPlayerList,
  });

  @override
  State<AddPlayersScreen> createState() => _AddPlayersScreenState();
}

class _AddPlayersScreenState extends State<AddPlayersScreen> {
  List<Map<String, dynamic>> selectedPlayers = [];

  TextEditingController searchController = TextEditingController();
  List<dynamic> players = [];
  List<dynamic> filteredPlayers = [];

  Future<void> fetchData() async {
    var position = (widget.position == 'GB')
        ? 'Goalkeeper'
        : ((widget.position == 'DF')
            ? 'Defender'
            : (widget.position == 'ML')
                ? 'Midfielder'
                : (widget.position == 'AT')
                    ? 'Attacker'
                    : '');
    final response = await ApiService.get('player/position/$position');
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        players = jsonData['data'];
        filteredPlayers = List.from(players);
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    filteredPlayers = players;
    searchController.addListener(_filterPlayers);
  }

  void _filterPlayers() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredPlayers = players.where((player) {
        return player["name"].toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                const Icon(Icons.sports_soccer, color: AppColors.primary),
                const SizedBox(width: 4),
                Text(
                  "100 PTS",
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              (widget.rowIndex == 0)
                  ? 'Gardien de but : الحارس نصف الجمعيّة'
                  : ((widget.rowIndex == 1)
                      ? 'Défenseur : صخرة الدّفاع'
                      : (widget.rowIndex == 2)
                          ? 'Milieu de terrain : مايسترو وسط الميدان'
                          : (widget.rowIndex == 3)
                              ? 'Attaquant : من نصف فرصة يمركي'
                              : 'Remplaçant'),
              (widget.rowIndex == 0)
                  ? "Joueur chargé de protéger le but, seul autorisé à utiliser ses mains, son rôle est d'empêcher les adversaires de marquer."
                  : ((widget.rowIndex == 1)
                      ? "Joueur responsable principalement d’arrêter les attaques adverses, protégeant ainsi son équipe contre les buts encaissés."
                      : (widget.rowIndex == 2)
                          ? "Joueur polyvalent qui relie la défense et l'attaque, chargé de récupérer le ballon, contrôler le jeu et créer des occasions."
                          : (widget.rowIndex == 3)
                              ? "Joueur spécialisé dans la finalisation des actions offensives, chargé de marquer des buts et créer le danger dans la surface adverse."
                              : 'Joker de l\'équipe. Sa principale responsabilité est de rester prêt à entrer en jeu pour apporter de l\'énergie, des compétences spécifiques ou un changement tactique. Il doit être polyvalent et mentalement prêt à avoir un impact immédiat sur le match.'),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(color: AppColors.cardBackground, width: 2),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Recherche',
                        labelStyle: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DataTable(
              columnSpacing: 15,
              // border: TableBorder.all(color: Colors.grey.shade900),
              dataRowMaxHeight: 75,
              headingRowHeight: 30,
              columns: const [
                DataColumn(
                  label: Text(
                    "C",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Équipe",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 90,
                    child: Text(
                      "Nom",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "PTS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Statut",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
              rows: filteredPlayers.asMap().entries.map((entry) {
                // int index = entry.key + 1;
                Map<String, dynamic> player = entry.value;
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        player["number"].toString(),
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    DataCell(
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  '${ApiService.baseUrlImg}/${player["logo"]}'),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.network(
                              '${ApiService.baseUrlImg}/${player["team"]["logo"]}',
                              fit: BoxFit.cover,
                              width: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayerProfilePage(
                              playerId: player["_id"],
                            ),
                          ),
                        );
                      },
                      Text(
                        player["name"],
                        maxLines: 3,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        player["age"].toString(),
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        player["number"].toString(),
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    DataCell(
                      _buildAddPlayer(player, player["age"], selectedPlayers),
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildAddPlayer(Map<String, dynamic> player, int playerPoints,
      List<Map<String, dynamic>> selectedPlayers) {
    var playerId = player['_id'];
    var selectedPlayersList = widget.selecterPlayerList;

    bool isSelected =
        selectedPlayersList.values.any((p) => p['_id'] == playerId);
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          setState(() {
            selectedPlayers.add(player);
          });

          Future.delayed(Duration(milliseconds: 500), () {
            Navigator.pop(context, player);
          });
        }
      },
      child: Container(
        width: 75,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cardBackground : AppColors.primary,
        ),
        child: Center(
          child: Text(
            isSelected ? "Acheté" : "+",
            style: TextStyle(
              fontSize: isSelected ? 12 : 25,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontFamily: 'BebasNeue',
            ),
          ),
        ),
      ),
    );
  }
}
