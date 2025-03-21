import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:passione_app/auth/forget-password.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/auth/create-an-account.dart';
import 'package:passione_app/main.dart';
import 'package:passione_app/widget/widget_page.dart';
import 'package:passione_app/widget/colors_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false;

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void loginAppel() async {
    setState(() {
      isLoading = true;
    });

    try {
      var res = await ApiService.get('auth/appel');

      if (!mounted) return;

      if (res.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyApp(
              isAuthenticated: true,
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
          content: const Text("Erreur lors de connexion avec appel."),
          backgroundColor: AppColors.alertRed,
        ),
      );
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  void loginGoogle() async {
    setState(() {
      isLoading = true;
    });

    try {
      var res = await ApiService.get('auth/auth/google');

      if (!mounted) return;

      if (res.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyApp(
              isAuthenticated: true,
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
          content: const Text("Erreur lors de connexion avec google."),
          backgroundColor: AppColors.alertRed,
        ),
      );
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  void login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      isLoading = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyApp(
          isAuthenticated: true,
        ),
      ),
    );
    try {
      var res = await ApiService.postWithoutToken(
        'auth/login',
        {
          "username": username,
          "password": password,
        },
      );

      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        await ApiService.saveDataToShared('connected_jwt_token', data['token']);
        await ApiService.saveDataToShared('connected_id', data['user']['_id']);
        await ApiService.saveDataToShared(
            'connected_name', data['user']['name']);
        await ApiService.saveDataToShared(
            'connected_userName', data['user']['username']);

        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyApp(
              isAuthenticated: true,
            ),
          ),
        );
      } else if (res.statusCode == 400) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            content: const Text("Passionne Id ou mot de passe incorrect"),
            backgroundColor: AppColors.alertRed,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
          content: const Text("Erreur de serveur"),
          backgroundColor: AppColors.alertRed,
        ),
      );
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 30,
              width: 35,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            const Baseline(
              baseline: 30,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                "Passionné",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'BebasNeue',
                  color: AppColors.textPrimary,
                  letterSpacing: 1.3,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 75),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Connectez-vous à Passione12",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Obtenez des nouvelles, des mises à jour de jeu, des moments forts et plus d'informations sur vos équipes préférées.",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    labelText: 'Passionne ID',
                    controller: usernameController,
                    fillColor: AppColors.cardBackground,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Mot de passe',
                    fillColor: AppColors.cardBackground,
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    backgroundColor: isLoading
                        ? AppColors.cardBackground
                        : AppColors.primary,
                    textColor: AppColors.textPrimary,
                    text: isLoading ? 'Chargement...' : 'Connexion',
                    fontFamily: 'BebasNeue',
                    borderRadius: 0,
                    onPressed: isLoading ? () {} : login,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Votre compte Passione est désormais un identifiant Passione. Si vous vous êtes déjà connecté à l'application, utilisez les mêmes identifiants ici. Sinon",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              color: AppColors.textPrimary,
              child: Column(
                children: [
                  CustomButton(
                    backgroundColor: AppColors.greyBackground,
                    textColor: AppColors.background,
                    text: 'CONTINUE WITH APPLE',
                    fontFamily: 'BebasNeue',
                    borderRadius: 0,
                    onPressed: loginAppel,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    backgroundColor: AppColors.greyBackground,
                    textColor: AppColors.background,
                    text: 'CONTINUE WITH GOOGLE',
                    fontFamily: 'BebasNeue',
                    borderRadius: 0,
                    onPressed: loginGoogle,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Vous n'avez pas de compte ?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.cardBackground,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Créer un compte",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.background,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
