import 'package:flutter/material.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class AboutAsPage extends StatelessWidget {
  const AboutAsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              'À propos de Passionne 12',
              "",
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Présentation de l\'application',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Bienvenue sur Passionne 12, la première plateforme 100% tunisienne dédiée aux passionnés du football local ! Notre mission est d'offrir une expérience immersive, ludique et compétitive autour de la Ligue Tunisienne de Football.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Notre vision',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Nous souhaitons rapprocher les supporters du football tunisien en leur permettant de devenir acteurs du jeu à travers une expérience Fantasy unique, conviviale et interactive.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Pourquoi choisir notre app ?',
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
                      "- Expérience 100% tunisienne : Focalisée exclusivement sur les équipes, les joueurs et l'ambiance du football tunisien.\n"
                      "- Communauté dynamique : Rejoignez une communauté active qui partage votre passion.\n"
                      "- Interface intuitive et amusante : Créez, gérez et suivez votre équipe facilement.",
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
                    'Notre équipe',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Nous sommes une équipe de passionnés de football et de technologies, dédiée à vous offrir la meilleure expérience utilisateur possible. Notre objectif est de vous accompagner tout au long de la saison pour vivre pleinement votre passion pour la Ligue Tunisienne.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nos valeurs',
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
                      "- Passion : Nous partageons votre amour du football.\n"
                      "- Innovation : Nous proposons constamment de nouvelles fonctionnalités.\n"
                      "- Transparence : Nous assurons une expérience équitable et transparente pour tous les utilisateurs.",
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
                    'Contactez-nous',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Avez-vous des questions, des suggestions ou des commentaires ? Nous sommes à votre écoute à [l'adresse email/contact support].",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Suivez-nous sur nos réseaux sociaux',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Facebook : [Lien]\nInstagram : [Lien]",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Merci de faire partie de l’aventure Passionne 12 ! Ensemble, célébrons le meilleur du football tunisien.',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.bold,
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
