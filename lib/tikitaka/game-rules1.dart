import 'package:flutter/material.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class GameRulesPage extends StatelessWidget {
  const GameRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              'Règles du Jeu',
              "",
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Points par Position',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Gardiens de But',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 18,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "• 90 minutes jouées : 1 point\n"
                      "• Clean sheet (sans encaisser) : 5 points\n"
                      "• Penalty arrêté : 10 points\n"
                      "• Passe décisive : 30 points\n"
                      "• But marqué : 50 points\n"
                      "• Penalty manqué : -4 points",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Défenseurs',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 18,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "• 90 minutes jouées : 1 point\n"
                      "• Clean sheet : 5 points\n"
                      "• Passe décisive : 5 points\n"
                      "• But marqué : 12 points\n"
                      "• Penalty manqué : -10 points",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Milieux de Terrain',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 18,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "• 90 minutes jouées : 1 point\n"
                      "• Clean sheet : 2 points\n"
                      "• Passe décisive : 3 points\n"
                      "• But marqué : 8 points\n"
                      "• Penalty manqué : -10 points",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Attaquants',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 18,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "• 90 minutes jouées : 1 point\n"
                      "• Clean sheet : 1 point\n"
                      "• Passe décisive : 2 points\n"
                      "• But marqué : 6 points\n"
                      "• Penalty manqué : -10 points",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Points Négatifs',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "• But contre son camp : -11 points\n"
                      "• Plus de 2 buts encaissés par un gardien/défenseur : -2 points\n"
                      "• Plus de 2 buts encaissés par un milieu/attaquant : -1 point\n"
                      "• 3 buts ou plus marqués par l’équipe : +2 points (gardien/défenseur), +4 points (milieu/attaquant)\n"
                      "• Carton rouge : -25 points\n"
                      "• Deux jaunes (rouge indirect) : -10 points",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Points Bonus',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "• Bonus Capitaine (x3 points capitaine) : 2 dinars\n"
                      "• Bonus Joueur Préféré (x4 points joueur préféré) : 4 dinars\n"
                      "• Bonus Changement de ligne : 8 dinars\n"
                      "• Bonus Changement d’Équipe : 15 dinars",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Transferts et Marché des Joueurs',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "• Prix des joueurs fluctue selon la popularité\n"
                      "• +0,1 P si sélectionné plus de 400 fois\n"
                      "• -0,1 P si sélectionné moins de 200 fois",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Gestion des Deadlines',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "• Journée finie après les 8 matchs\n"
                      "• Deadline bloqué pendant la journée\n"
                      "• Journée reportée = points valides, mais deadline considérée jouée",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
