import 'package:flutter/material.dart';
import 'package:passione_app/main.dart';
import 'package:passione_app/tikitaka/blog-detail.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedJournee = 'Journée 1';
  int slideIndex = 0;

  final List<String> galleryImages = [
    'https://storage.googleapis.com/a1aa/image/oNYHXB7qIGtZccZyLQHhk1_CdskvmkVuUffuPEV3Unk.jpg',
    'https://storage.googleapis.com/a1aa/image/QcmMtf7Byt0SPY_3FrB8H2FRbA3ZlZro7h0irGzcPTs.jpg',
    'https://storage.googleapis.com/a1aa/image/a53D7Dov9wYy0d-wrIYVPbjCu_9BK-BfJd_FkGLRM-c.jpg',
    'https://storage.googleapis.com/a1aa/image/8qglPsOkpX_jkOhqd25_WHcjz3rkp-601gQR8_wbc6g.jpg',
  ];

  void nextSlide() {
    setState(() {
      slideIndex = (slideIndex + 1) % galleryImages.length;
    });
  }

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

  List<Map<String, dynamic>> getActivePlayers(
      List<Map<String, dynamic>> players) {
    return players.where((player) => player['isSubstituted'] == false).toList();
  }

  final List<Map<String, String>> matches = [
    {"team1": "ESS", "team2": "EST", "status": "home"},
    {"team1": "CA", "team2": "CSS", "status": "away"},
    {"team1": "USM", "team2": "ST", "status": "home"},
    {"team1": "JSK", "team2": "CAB", "status": "away"},
  ];
  final List<String> journees = List.generate(
    36,
    (index) => 'Journée ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> players = pickteam[0]["players"];
    List<Map<String, dynamic>> activePlayers = getActivePlayers(players);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
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
                    SizedBox(height: 8),
                    Text(
                      'JOURNÉE 1 DEADLINE:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 28,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: nextSlide,
                    child: SizedBox(
                      height: 200,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Container(
                          key: ValueKey<int>(slideIndex),
                          height: 200,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black,
                          ),
                          child: Image.network(
                            galleryImages[slideIndex],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      galleryImages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: slideIndex == index ? 12 : 8,
                        height: slideIndex == index ? 12 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (slideIndex == index)
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MainPage(initialIndex: 1),
                              ),
                            );
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
                      height: 180,
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
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.cardBackground,
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'VOTRE ÉQUIPE',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          value: selectedJournee,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedJournee = newValue!;
                            });
                          },
                          items: journees
                              .map<DropdownMenuItem<String>>((String value) {
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '100',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BebasNeue',
                                height: .5,
                              ),
                            ),
                            Text(
                              'Points',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 10,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            Text(
                              'Classement',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 8,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '1er / 32541',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 10,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/stadeImg.png"),
                          fit: BoxFit.fill,
                        ),
                        color: AppColors.cardBackground,
                      ),
                      child: Row(
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
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(8),
                color: AppColors.cardBackground,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'LEAGUE TN',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MainPage(initialIndex: 10),
                              ),
                            );
                          },
                          child: const Text(
                            'Voir Plus',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontFamily: 'BebasNeue',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BlogDetailsPage(
                                      blogId: "1",
                                    ),
                                  ),
                                )
                              },
                              child: Container(
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        'https://storage.googleapis.com/a1aa/image/oNYHXB7qIGtZccZyLQHhk1_CdskvmkVuUffuPEV3Unk.jpg',
                                        width: 80,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Qatar WorldCup 2022',
                                            style: TextStyle(
                                              color: AppColors.textPrimary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'BebasNeue',
                                              height: 1,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Best of Portugal goals against Switzerla goals against Switzerla goals against Switzerland',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 8,
                                            ),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(8),
                color: AppColors.cardBackground,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'INFOS FRAÎCHES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MainPage(initialIndex: 10),
                              ),
                            );
                          },
                          child: const Text(
                            'Voir Plus',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontFamily: 'BebasNeue',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Build rows of 2 cards per line
                    Column(
                      children: List.generate((4 / 2).ceil(), (rowIndex) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(2, (colIndex) {
                            // int index = rowIndex * 2 + colIndex;

                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BlogDetailsPage(
                                          blogId: "1",
                                        ),
                                      ),
                                    )
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          'https://storage.googleapis.com/a1aa/image/oNYHXB7qIGtZccZyLQHhk1_CdskvmkVuUffuPEV3Unk.jpg',
                                          width: double.infinity,
                                          height: 135,
                                          fit: BoxFit.cover,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Qatar WorldCup 2022',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                'Best of Portugal goals against Switzerland',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 8,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(8),
                color: AppColors.cardBackground,
                child: Column(
                  children: [
                    const Text(
                      'NOS PARTENAIRES',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 75,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Image.network(
                              'https://storage.googleapis.com/a1aa/image/0rNNkiGiXwlePqpDY34cC2sPpbr-oCfSyqlC4XvUmsc.jpg',
                              width: 75,
                              height: 75,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSoccerRow(List<Map<String, dynamic>> players) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: players.map((player) {
      Map<String, dynamic> playerDetails = player['player_details'];

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  playerDetails["image"],
                  width: 35,
                  height: 35,
                ),
                if (playerDetails["id"] == "1")
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/captain.png',
                      width: 15,
                    ),
                  )
                else if (playerDetails["id"] == "2")
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/uncertain.png',
                      width: 15,
                    ),
                  )
                else if (playerDetails["id"] == "3")
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/mvp.png',
                      width: 15,
                    ),
                  )
                else if (playerDetails["id"] == "4")
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/vice.png',
                      width: 15,
                    ),
                  )
                else if (playerDetails["id"] == "5")
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/will-not-play.png',
                      width: 15,
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
                width: 10,
                height: 15,
                padding: const EdgeInsets.only(top: 2),
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Text(
                  playerDetails["id"],
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BebasNeue',
                  ),
                ),
              ),
              Container(
                width: 35,
                height: 15,
                padding: const EdgeInsets.only(top: 2),
                decoration: const BoxDecoration(color: AppColors.textPrimary),
                child: Text(
                  playerDetails["name"],
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF141414),
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BebasNeue',
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }).toList(),
  );
}
