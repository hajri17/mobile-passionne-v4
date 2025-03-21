import 'package:flutter/material.dart';
import 'package:passione_app/auth/login.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/widget/widget_page.dart';
import 'package:passione_app/widget/colors_page.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => NewPasswordPageState();
}

class NewPasswordPageState extends State<NewPasswordPage> {
  bool isPasswordVisible = false;
  bool isLoading = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Le mot de passe ne peut pas être vide";
    }
    if (value.length < 8) {
      return "Le mot de passe doit comporter au moins 8 caractères";
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Le mot de passe doit contenir au moins une lettre majuscule";
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Le mot de passe doit contenir au moins un symbole";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return "Les mots de passe ne correspondent pas";
    }
    return null;
  }

  void changePassword() async {
    if (_formKey.currentState!.validate()) {
      String password = passwordController.text.trim();
      setState(() {
        isLoading = true;
      });

      try {
        var res = await ApiService.update(
          'auth/update-password',
          {
            "newpassword": password,
          },
        );

        if (!mounted) return;

        if (res.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
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
            content: Text("Passionne Id ou mot de passe incorrect"),
            backgroundColor: AppColors.alertRed,
          ),
        );
      }
    }
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Créez votre nouveau mot de passe",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BebasNeue',
                  ),
                ),
                const SizedBox(height: 30),

                // New Password Field
                CustomTextField(
                  labelText: 'Mot de passe',
                  fillColor: AppColors.cardBackground,
                  obscureText: !isPasswordVisible,
                  controller: passwordController,
                  validator: validatePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: togglePasswordVisibility,
                  ),
                ),

                const SizedBox(height: 10),
                const Text(
                  "Le mot de passe doit comporter au moins 8 caractères et inclure 1 lettre majuscule et 1 symbole",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 20),

                // Confirm Password Field
                CustomTextField(
                  labelText: 'Confirmez le mot de passe',
                  fillColor: AppColors.cardBackground,
                  obscureText: !isPasswordVisible,
                  controller: confirmPasswordController,
                  validator: validateConfirmPassword,
                ),

                const SizedBox(height: 20),

                // Submit Button
                CustomButton(
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.textPrimary,
                  text: 'Changer le mot de passe',
                  fontFamily: 'BebasNeue',
                  borderRadius: 0,
                  onPressed: isLoading ? () {} : changePassword,
                ),

                const SizedBox(height: 5),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Vous avez déjà un compte ?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
