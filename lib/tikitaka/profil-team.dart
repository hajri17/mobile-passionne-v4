import 'package:flutter/material.dart';
import 'package:passione_app/tikitaka/profil-player.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class TeamResultsScreen extends StatefulWidget {
  final String teamId;

  const TeamResultsScreen({super.key, required this.teamId});

  @override
  State<TeamResultsScreen> createState() => _TeamResultsScreenState();
}

class _TeamResultsScreenState extends State<TeamResultsScreen> {
  int selectedTabIndex = 0;

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
          "Détails du équipe",
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
            // Header with team name & logo
            Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              color: AppColors.primary,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/ess_logo.png',
                    height: 64,
                    width: 55,
                  ),
                  const SizedBox(width: 25),
                  const Text(
                    "ETOILE SPORTIVE\nDU SAHEL",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ],
              ),
            ),

            // Stadium info section
            Container(
              padding: const EdgeInsets.all(15),
              color: AppColors.background,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/stade.png',
                    height: 30,
                    width: 35,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "STADE OLYMPIQUE DE SOUSSE",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BebasNeue',
                        ),
                      ),
                      Text(
                        "Capacité: 40 000 places",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Tabs Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: AppColors.cardBackground,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tabButton("Résultats", 0),
                  tabButton("Calendrier", 1),
                  tabButton("Classement", 2),
                  tabButton("Effectif", 3),
                ],
              ),
            ),

            // Display content based on the active tab
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: IndexedStack(
                index: selectedTabIndex,
                children: [
                  resultsSection(),
                  calendarSection(),
                  classementSection(),
                  effectifSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tab Button
  Widget tabButton(String title, int index) {
    bool isActive = selectedTabIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? AppColors.primary : AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          if (isActive)
            Container(
              height: 1,
              width: 50,
              color: AppColors.primary,
            ),
        ],
      ),
    );
  }

  // Section 1: Results
  Widget resultsSection() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          matchCard("ESS", '2', '1', "EST", 'win', 'home'),
          matchCard("EST", '2', '1', "ESS", 'lose', 'away'),
          matchCard("EST", '2', '2', "ESS", 'drow', 'away'),
          matchCard("ESS", '2', '3', "EST", 'lose', 'home'),
        ],
      ),
    );
  }

  // Section 2: Calendar
  Widget calendarSection() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          matchCard("ESS", '', '', "EST", '', 'home'),
          matchCard("EST", '', '', "ESS", '', 'away'),
          matchCard("EST", '', '', "ESS", '', 'away'),
          matchCard("ESS", '', '', "EST", '', 'home'),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> teams = [
    {"rank": 1, "logo": "assets/images/ess_logo.png", "name": "ES Sahel"},
    {"rank": 2, "logo": "assets/images/ess_logo.png", "name": "Stade Tunisien"},
    {"rank": 3, "logo": "assets/images/ess_logo.png", "name": "Club Africain"},
    {"rank": 4, "logo": "assets/images/ess_logo.png", "name": "ES Tunis"},
    {"rank": 5, "logo": "assets/images/ess_logo.png", "name": "US Monastir"},
    {"rank": 6, "logo": "assets/images/ess_logo.png", "name": "CS Sfaxien"},
    {"rank": 1, "logo": "assets/images/ess_logo.png", "name": "ES Sahel"},
    {"rank": 2, "logo": "assets/images/ess_logo.png", "name": "Stade Tunisien"},
    {"rank": 3, "logo": "assets/images/ess_logo.png", "name": "Club Africain"},
    {"rank": 4, "logo": "assets/images/ess_logo.png", "name": "ES Tunis"},
    {"rank": 5, "logo": "assets/images/ess_logo.png", "name": "US Monastir"},
    {"rank": 6, "logo": "assets/images/ess_logo.png", "name": "CS Sfaxien"},
  ];

  final List<Map<String, dynamic>> players = [
    {
      "id": "1",
      "rank": 1,
      "team": "assets/images/ess_logo.png",
      "logo": "assets/images/player_avatar.png",
      "name": "Ali Jmal",
      "position": "GB"
    },
    {
      "id": "2",
      "rank": 2,
      "team": "assets/images/ess_logo.png",
      "logo": "assets/images/player_avatar.png",
      "name": "Megan Schutt",
      "position": "DF"
    },
    {
      "id": "3",
      "rank": 3,
      "team": "assets/images/ess_logo.png",
      "logo": "assets/images/player_avatar.png",
      "name": "Annabel land",
      "position": "ML"
    },
    {
      "id": "4",
      "rank": 4,
      "team": "assets/images/ess_logo.png",
      "logo": "assets/images/player_avatar.png",
      "name": "Alana King",
      "position": "AT"
    },
    {
      "id": "5",
      "rank": 5,
      "team": "assets/images/ess_logo.png",
      "logo": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "position": "GB"
    },
    {
      "id": "6",
      "rank": 6,
      "team": "assets/images/ess_logo.png",
      "logo": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "position": "DF"
    },
    {
      "id": "1",
      "rank": 1,
      "team": "assets/images/ess_logo.png",
      "logo": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "position": "ML"
    },
    {
      "id": "2",
      "rank": 2,
      "team": "assets/images/ess_logo.png",
      "logo": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "position": "AT"
    },
    {
      "id": "3",
      "rank": 3,
      "team": "assets/images/ess_logo.png",
      "logo": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "position": "AT"
    },
    {
      "id": "4",
      "rank": 4,
      "team": "assets/images/ess_logo.png",
      "logo": "assets/images/player_avatar.png",
      "name": "Saulo A. C.",
      "position": "AT"
    },
  ];

  // Section 3: Classement
  Widget classementSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Table(
            columnWidths: const {
              0: FixedColumnWidth(30),
              1: FlexColumnWidth(),
              2: FixedColumnWidth(40),
              3: FixedColumnWidth(40),
              4: FixedColumnWidth(40),
              5: FixedColumnWidth(40),
            },
            border: TableBorder.symmetric(
              inside: const BorderSide(
                color: AppColors.background,
                width: 1,
              ),
            ),
            children: [
              TableRow(
                decoration: const BoxDecoration(color: AppColors.background),
                children: [
                  tableHeaderCell('C'),
                  tableHeaderCell('Équipe'),
                  tableHeaderCell('A'),
                  tableHeaderCell('P'),
                  tableHeaderCell('S'),
                  tableHeaderCell('T'),
                ],
              ),
              for (var team in teams) ...[
                TableRow(
                  decoration: const BoxDecoration(
                    color: AppColors.cardBackground,
                  ),
                  children: [
                    tableCell(team['rank'].toString()),
                    teamCell(team['logo'], team['name']),
                    tableCell("32"),
                    tableCell("120"),
                    tableCell("120"),
                    tableCell("120"),
                  ],
                ),
                const TableRow(children: [
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                ]),
              ],
            ],
          ),
        ],
      ),
    );
  }

  // Section 4: Effectif
  Widget effectifSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Table(
            columnWidths: const {
              0: FixedColumnWidth(30),
              1: FlexColumnWidth(),
              2: FixedColumnWidth(40),
              3: FixedColumnWidth(40),
              4: FixedColumnWidth(40),
              5: FixedColumnWidth(40),
            },
            border: TableBorder.symmetric(
              inside: const BorderSide(
                color: AppColors.background,
                width: 1,
              ),
            ),
            children: [
              TableRow(
                decoration: const BoxDecoration(color: AppColors.background),
                children: [
                  tableHeaderCell('C'),
                  tableHeaderCell('Joueur'),
                  tableHeaderCell('A'),
                  tableHeaderCell('P'),
                  tableHeaderCell('S'),
                ],
              ),
              for (var player in players) ...[
                TableRow(
                  decoration: const BoxDecoration(
                    color: AppColors.cardBackground,
                  ),
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayerProfilePage(playerId: player['id']),
                          ),
                        ),
                      },
                      child: tableCell(player['rank'].toString()),
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayerProfilePage(playerId: player['id']),
                          ),
                        ),
                      },
                      child: playerCell(
                          player['team'], player['logo'], player['name']),
                    ),
                    tableCell("32"),
                    tableCell("120"),
                    tableCell(player['position']),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
