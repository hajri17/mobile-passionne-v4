import 'package:flutter/material.dart';
import 'package:passione_app/auth/create-an-account.dart';
import 'package:passione_app/auth/login.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: AppColors.background.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 60,
                      ),
                      const Text(
                        "Passionné",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'BebasNeue',
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "TOUNES EL KOL\nPASSIONE",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'BebasNeue',
                        height: 0,
                      ),
                    ),
                    const Text(
                      "Regardez les événements sportifs en direct ou en temps réel, lisez toutes les actualités depuis votre smartphone",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      backgroundColor: AppColors.primary,
                      textColor: AppColors.textPrimary,
                      text: 'Connexion',
                      fontFamily: 'BebasNeue',
                      borderRadius: 0,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      backgroundColor: AppColors.textPrimary,
                      textColor: AppColors.background,
                      text: 'Create Account',
                      fontFamily: 'BebasNeue',
                      borderRadius: 0,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
