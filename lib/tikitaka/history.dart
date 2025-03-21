import 'package:flutter/material.dart';
import 'package:passione_app/tikitaka/profil-player.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class HistoriqueScreen extends StatefulWidget {
  const HistoriqueScreen({super.key});

  @override
  State<HistoriqueScreen> createState() => _HistoriqueScreenState();
}

class _HistoriqueScreenState extends State<HistoriqueScreen> {
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
          "Historique de Tikitaka",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontFamily: 'BebasNeue',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(
            'HISTORIQUE',
            "Protecteur ultime du but. Sa principale responsabilité est d'empêcher le ballon de pénétrer dans les filets",
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              tabButton("Changements", 0, Icons.published_with_changes_rounded),
              tabButton("Transfères", 1, Icons.transform_outlined),
            ],
          ),

          // Display content based on the active tab
          Expanded(
            child: SingleChildScrollView(
              child: IndexedStack(
                index: selectedTabIndex,
                children: const [
                  Changements(),
                  Transferes(),
                ],
              ),
            ),
          ),
        ],
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
          const SizedBox(height: 10),
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

class Changements extends StatelessWidget {
  const Changements({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'GARDIENT DE BUT',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "BebasNeue",
            ),
          ),
          const SizedBox(height: 8),
          playerCard(context, "up", "changement"),
          playerCard(context, "down", "changement"),
          const SizedBox(height: 16),
          const Text(
            'Défenceur',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "BebasNeue",
            ),
          ),
          const SizedBox(height: 8),
          playerCard(context, "up", "changement"),
          playerCard(context, "down", "changement"),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class Transferes extends StatelessWidget {
  const Transferes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'GARDIENT DE BUT',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "BebasNeue",
            ),
          ),
          const SizedBox(height: 8),
          playerCard(context, "up", "transfere"),
          playerCard(context, "down", "transfere"),
          const SizedBox(height: 16),
          const Text(
            'Défenceur',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "BebasNeue",
            ),
          ),
          const SizedBox(height: 8),
          playerCard(context, "up", "transfere"),
          playerCard(context, "down", "transfere"),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

Widget playerCard(context, String status, String statusText) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: Colors.grey[850],
      borderRadius: BorderRadius.circular(0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 1),
        Icon(
          (status == 'down')
              ? ((statusText == 'transfere')
                  ? Icons.subdirectory_arrow_left
                  : Icons.arrow_downward)
              : ((statusText == 'transfere')
                  ? Icons.subdirectory_arrow_right
                  : Icons.arrow_upward),
          color: (status == 'down') ? AppColors.alertRed : AppColors.primary,
        ),
        SizedBox(
          width: 100,
          child: Row(
            children: [
              Stack(
                children: [
                  const SizedBox(
                    height: 35,
                    width: 35,
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
                      width: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              const Flexible(
                child: Text(
                  "name",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        const CustomText(text: "32"),
        const CustomText(text: "120"),
        const CustomText(text: "100"),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlayerProfilePage(
                  playerId: "1",
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(0),
            ),
            child: const Icon(Icons.remove_red_eye, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
