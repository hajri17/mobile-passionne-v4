import 'package:flutter/material.dart';
import 'package:passione_app/tikitaka/profil-team.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class LeagueClassificationPage extends StatefulWidget {
  const LeagueClassificationPage({super.key});

  @override
  State<LeagueClassificationPage> createState() =>
      _LeagueClassificationPageState();
}

class _LeagueClassificationPageState extends State<LeagueClassificationPage> {
  final List<Map<String, dynamic>> teams = [
    {
      "id": "12",
      "rank": 1,
      "logo": "assets/images/ess_logo.png",
      "name": "ES Sahel"
    },
    {
      "id": "12",
      "rank": 2,
      "logo": "assets/images/ess_logo.png",
      "name": "Stade Tunisien"
    },
    {
      "id": "12",
      "rank": 3,
      "logo": "assets/images/ess_logo.png",
      "name": "Club Africain"
    },
    {
      "id": "12",
      "rank": 4,
      "logo": "assets/images/ess_logo.png",
      "name": "ES Tunis"
    },
    {
      "id": "12",
      "rank": 5,
      "logo": "assets/images/ess_logo.png",
      "name": "US Monastir"
    },
    {
      "id": "12",
      "rank": 6,
      "logo": "assets/images/ess_logo.png",
      "name": "CS Sfaxien"
    },
    {
      "id": "12",
      "rank": 7,
      "logo": "assets/images/ess_logo.png",
      "name": "ES Sahel"
    },
    {
      "id": "12",
      "rank": 8,
      "logo": "assets/images/ess_logo.png",
      "name": "Stade Tunisien"
    },
    {
      "id": "12",
      "rank": 9,
      "logo": "assets/images/ess_logo.png",
      "name": "Club Africain"
    },
    {
      "id": "12",
      "rank": 10,
      "logo": "assets/images/ess_logo.png",
      "name": "ES Tunis"
    },
    {
      "id": "12",
      "rank": 11,
      "logo": "assets/images/ess_logo.png",
      "name": "US Monastir"
    },
    {
      "id": "12",
      "rank": 12,
      "logo": "assets/images/ess_logo.png",
      "name": "CS Sfaxien"
    },
  ];

  final List<Map<String, String>> matches = [
    {"team1": "ESS", "team2": "EST", "status": "home"},
    {"team1": "CA", "team2": "CSS", "status": "away"},
    {"team1": "USM", "team2": "ST", "status": "home"},
    {"team1": "JSK", "team2": "CAB", "status": "away"},
  ];

  bool showAllTeams = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayedTeams =
        showAllTeams ? teams : teams.take(6).toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              'League TN',
              "Protecteur ultime du but. Sa principale responsabilité est d'empêcher le ballon de pénétrer dans les filets.",
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 18.0, left: 16),
                child: Text(
                  "CLASSEMENT LEAGUE 1",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.textPrimary,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
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
                        decoration:
                            const BoxDecoration(color: AppColors.background),
                        children: [
                          tableHeaderCell('C'),
                          tableHeaderCell('Équipe'),
                          tableHeaderCell('A'),
                          tableHeaderCell('P'),
                          tableHeaderCell('S'),
                          tableHeaderCell('T'),
                        ],
                      ),
                      for (var team in displayedTeams) ...[
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
                                        TeamResultsScreen(teamId: team['id']),
                                  ),
                                ),
                              },
                              child: tableCell(team['rank'].toString()),
                            ),
                            GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TeamResultsScreen(teamId: team['id']),
                                  ),
                                ),
                              },
                              child: teamCell(team['logo'], team['name']),
                            ),
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
                  CustomButton(
                    backgroundColor: AppColors.primary,
                    textColor: AppColors.textPrimary,
                    text: showAllTeams ? "Voir Moins" : "Voir Plus",
                    fontFamily: 'BebasNeue',
                    borderRadius: 0,
                    onPressed: () {
                      setState(() {
                        showAllTeams = !showAllTeams;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, left: 8),
              decoration: const BoxDecoration(
                color: Color(0xFF181818),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "LEAGUE TN",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.textPrimary,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          print('Button with Icon after Text pressed');
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                        ),
                        child: const Text(
                          'Voir Plus',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 190,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: matches.length,
                      itemBuilder: (context, index) {
                        final match = matches[index];
                        return matchFixedCard(
                          context,
                          match["team1"]!,
                          match["team2"]!,
                          match["status"]!,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 190,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: matches.length,
                      itemBuilder: (context, index) {
                        final match = matches[index];
                        return matchFixedCard(
                          context,
                          match["team1"]!,
                          match["team2"]!,
                          match["status"]!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
