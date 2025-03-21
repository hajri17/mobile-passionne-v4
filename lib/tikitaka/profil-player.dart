import 'package:flutter/material.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class PlayerProfilePage extends StatefulWidget {
  final String playerId;

  const PlayerProfilePage({super.key, required this.playerId});

  @override
  State<PlayerProfilePage> createState() => _PlayerProfilePageState();
}

class _PlayerProfilePageState extends State<PlayerProfilePage> {
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
          "Détails du joueur",
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
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                const Positioned(
                  left: 50,
                  bottom: 0,
                  height: 230,
                  child: Text(
                    '01',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 200,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.55, -0.84),
                      end: const Alignment(-0.55, 0.84),
                      colors: [
                        AppColors.primary.withOpacity(0.75),
                        AppColors.cardBackground.withOpacity(0.75)
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Not owned',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            'ALI JMAL',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 40,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/ess_logo.png',
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Etoile sportive\ndu Sahel',
                                maxLines: 2,
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '+120 PTS',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 24,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/player_avatar.png',
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Tabs Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: AppColors.cardBackground,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tabButton("Infos Générales", 0, Icons.info),
                  tabButton("Stats", 1, Icons.stacked_bar_chart_rounded),
                ],
              ),
            ),

            // Display content based on the active tab
            SizedBox(
              child: IndexedStack(
                index: selectedTabIndex,
                children: const [
                  GeneralInfoTab(),
                  StatsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabButton(String title, int index, IconData icon) {
    bool isActive = selectedTabIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isActive ? AppColors.primary : AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                icon,
                size: 15,
                color: (isActive) ? AppColors.primary : AppColors.textPrimary,
              )
            ],
          ),
          const SizedBox(height: 7),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width / 2,
            color: (isActive) ? AppColors.primary : AppColors.textPrimary,
          ),
          const SizedBox(height: 7),
        ],
      ),
    );
  }
}

class GeneralInfoTab extends StatelessWidget {
  const GeneralInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildStatColumn('Prix', '10,1MD', '2 sur 339'),
                const VerticalDivider(
                  color: AppColors.textPrimary,
                  width: 3,
                ),
                buildStatColumn('Pts / Match', '6.8', '2 sur 10109'),
                const VerticalDivider(
                  color: AppColors.textPrimary,
                  width: 3,
                ),
                buildStatColumn('Sélectionné par', '68,8%', '2 sur 339'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          buildInfoRow('Nationalité', 'Tunisien', 'assets/images/tn.png'),
          buildInfoRow('Date de naissance', '26/06/1998'),
          buildInfoRow('Age', '24'),
          buildInfoRow('Club', 'ESS', 'assets/images/ess_logo.png'),
          buildInfoRow('Position', 'Gardiant'),
          buildInfoRow('Debut', '12 September 2021'),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: [
              buildImage('assets/images/player_avatar.png'),
              buildImage('assets/images/player_avatar.png'),
              buildImage('assets/images/player_avatar.png'),
              buildImage('assets/images/player_avatar.png'),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});
  int _calculateTotalPoints() {
    List<int> points = [5, 5, 0, 0, 2];
    return points.reduce((sum, value) => sum + value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "CETTE SAISON",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              fontFamily: 'BebasNeue',
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF141414),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: AppColors.textPrimary, width: .5),
            ),
            child: Column(
              children: [
                buildInfoRow("161 Minutes played", "5 PTS"),
                buildInfoRow("1 Goal Scored", "5 PTS"),
                buildInfoRow("2 Yellow Cards", "0 PTS"),
                buildInfoRow("1 Red card", "0 PTS"),
                buildInfoRow("1 Ball recovered", "2 PTS"),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "TOTAL ${_calculateTotalPoints()} PTS",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "POINTS PAR JEUX",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              fontFamily: 'BebasNeue',
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF141414),
            ),
            child: matchFullDetail("ESS", '2', '1', "EST", 'win', 'home'),
          ),
        ],
      ),
    );
  }
}
