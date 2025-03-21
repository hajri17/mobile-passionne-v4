import 'package:flutter/material.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class TermConditionPage extends StatelessWidget {
  const TermConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              'Terms & conditions',
              "",
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '1. Acceptation des termes',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "En utilisant Passionne 12 , vous acceptez pleinement ces termes et conditions. Si vous n'acceptez pas ces termes, veuillez ne pas utiliser notre service.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    '2. Création et gestion du compte utilisateur',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    'Vous devez fournir des informations exactes et complètes lors de votre inscription.Vous êtes responsable de la confidentialité de vos informations de connexion.Toute activité effectuée via votre compte relève de votre entière responsabilité.',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    '3. Utilisation du service',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Passionne 12 est destiné à un usage personnel, non commercial.Vous vous engagez à ne pas utiliser l'application à des fins frauduleuses ou illégales.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    '4. Fonctionnement du jeu',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Les règles du jeu Tiki Taka sont clairement indiquées dans la section 'Règles du Jeu' de l'application.Passionne 12 se réserve le droit de modifier les règles à tout moment avec préavis.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    '5. Gestion des deadlines',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Les deadlines pour les modifications de votre équipe sont strictement définies par l'heure du début de la première rencontre de chaque journée de championnat.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    '6. Responsabilité',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Nous ne sommes pas responsables des pertes ou dommages liés à l’utilisation ou à l'impossibilité d'utiliser l'application.Nous ne garantissons pas une disponibilité continue et sans interruption du service.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    '7. Protection des données personnelles',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Vos données personnelles sont protégées conformément à notre Politique de confidentialité. Consultez notre politique de confidentialité pour plus d'informations.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    '8. Propriété intellectuelle',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Tous les contenus et éléments visuels de l'application sont la propriété exclusive de Passionne 12 ou ses partenaires.Il est interdit de copier, reproduire ou exploiter ces éléments sans autorisation écrite préalable.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    '9. Modifications des termes',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Nous pouvons modifier ces termes et conditions à tout moment. Les utilisateurs seront informés des modifications via une notification dans l'application ou par email.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    '10. Résiliation d’accès',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    'Nous nous réservons le droit de suspendre ou résilier votre accès en cas de violation des présentes conditions.',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    '11. Contact',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Pour toute question ou réclamation, veuillez nous contacter à : [l'adresse email/contact support].",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
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
