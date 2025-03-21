import 'package:flutter/material.dart';
import 'package:passione_app/tikitaka/create-team.dart';
import 'package:passione_app/tikitaka/profil-player.dart';
import 'package:passione_app/tikitaka/team-data.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class AddPlayersScreen extends StatefulWidget {
  final int columnIndex;
  final int rowIndex;
  const AddPlayersScreen({
    super.key,
    required this.columnIndex,
    required this.rowIndex,
  });

  @override
  State<AddPlayersScreen> createState() => _AddPlayersScreenState();
}

class _AddPlayersScreenState extends State<AddPlayersScreen> {
  TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> players = [
    {
      "id": "1",
      "image": "assets/images/player_avatar.png",
      "name": "Darcie Brown",
      "price": 2,
      "points": 120,
    },
    {
      "id": "2",
      "image": "assets/images/player_avatar.png",
      "name": "hama hama hama Schutt",
      "price": 9,
      "points": 210,
    },
    {
      "id": "3",
      "image": "assets/images/player_avatar.png",
      "name": "Annabel land",
      "price": 8,
      "points": 140,
    },
    {
      "id": "4",
      "image": "assets/images/player_avatar.png",
      "name": "Alana King",
      "price": 6,
      "points": 180,
    },
    {
      "id": "5",
      "image": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "price": 6,
      "points": 96,
    },
    {
      "id": "6",
      "image": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "price": 5,
      "points": 86,
    },
    {
      "id": "7",
      "image": "assets/images/player_avatar.png",
      "name": "Darcie Brown",
      "price": 2,
      "points": 120,
    },
    {
      "id": "8",
      "image": "assets/images/player_avatar.png",
      "name": "Megan Schutt",
      "price": 9,
      "points": 210,
    },
    {
      "id": "9",
      "image": "assets/images/player_avatar.png",
      "name": "Annabel land",
      "price": 8,
      "points": 140,
    },
    {
      "id": "10",
      "image": "assets/images/player_avatar.png",
      "name": "Alana King",
      "price": 6,
      "points": 180,
    },
    {
      "id": "11",
      "image": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "price": 5,
      "points": 80,
    },
    {
      "id": "12",
      "image": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "price": 6,
      "points": 96,
    },
    {
      "id": "13",
      "image": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "price": 5,
      "points": 86,
    },
    {
      "id": "14",
      "image": "assets/images/player_avatar.png",
      "name": "Darcie Brown",
      "price": 2,
      "points": 120,
    },
    {
      "id": "15",
      "image": "assets/images/player_avatar.png",
      "name": "Megan Schutt",
      "price": 9,
      "points": 210,
    },
  ];
  List<Map<String, dynamic>> filteredPlayers = [];

  @override
  void initState() {
    super.initState();
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
      backgroundColor: Colors.black,
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
                  "${TeamData().remainingPoints} PTS",
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
              columnSpacing: 10,
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
                    width: 120,
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
                int index = entry.key + 1;
                Map<String, dynamic> player = entry.value;
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        "$index",
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
                          const SizedBox(
                            height: 40,
                            width: 40,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/player_avatar.png'),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.asset(
                              'assets/images/ess_logo.png',
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
                              playerId: player["id"],
                            ),
                          ),
                        );
                      },
                      Text(
                        player["name"],
                        maxLines: 3,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        player["price"].toString(),
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        player["points"].toString(),
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    DataCell(
                      _buildAddPlayer(player, player["price"]),
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

  Widget _buildAddPlayer(Map<String, dynamic> player, int playerPoints) {
    var playerId = player['id'];
    bool isSelected = TeamData().isPlayerSelected(playerId);

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          null;
        } else {
          TeamData().addOrUpdatePlayer(
            '${widget.rowIndex}-${widget.columnIndex}',
            playerId,
            playerPoints,
          );

          // TeamData().updatePlayerAtPosition(
          //   '${widget.rowIndex}-${widget.columnIndex}',
          //   playerId,
          // );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTeamScreen(
                player: player,
                rowIndex: widget.rowIndex,
                columnIndex: widget.columnIndex,
              ),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
