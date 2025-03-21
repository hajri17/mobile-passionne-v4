import 'package:flutter/material.dart';
import 'package:passione_app/auth/login.dart';
import 'package:passione_app/auth/otp-verfication.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isLoading = false;

  bool? isSelected = false;

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  bool isPasswordValid(String password) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
    return regex.hasMatch(password);
  }

  void createAccount() async {
    String username = usernameController.text.trim();
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
          content: const Text("Les mots de passe ne correspondent pas."),
          backgroundColor: AppColors.alertRed,
        ),
      );
      return;
    }

    // if (!isPasswordValid(password)) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(

    //       content: Text(
    //           "Le mot de passe doit contenir au moins 8 caractères, une majuscule et un symbole."),
    //       backgroundColor: AppColors.alertRed,
    //     ),
    //   );
    //   return;
    // }

    setState(() {
      isLoading = true;
    });

    try {
      var res = await ApiService.postWithoutToken(
        'auth/register',
        {
          "username": username,
          "name": name,
          "email": email,
          "telephone": phone,
          "password": password,
        },
      );

      if (!mounted) return;

      if (res.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerificationPage(
              origin: 'signup',
              phoneNumber: phone,
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
            content: const Text(
                "Erreur lors de l'inscription. Utilisateur déjà enregistré"),
            backgroundColor: AppColors.alertRed,
          ),
        );
      } else {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            content:
                const Text("Erreur lors de l'inscription. Erreur serveur..."),
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
          content: const Text("Erreur lors de l'inscription."),
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Créez votre identifiant Passionne12",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BebasNeue',
                ),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                labelText: 'Passionne ID',
                controller: usernameController,
                fillColor: AppColors.cardBackground,
                obscureText: false,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                labelText: 'Nom et Prénom',
                controller: nameController,
                fillColor: AppColors.cardBackground,
                obscureText: false,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                labelText: 'E-Mail',
                controller: emailController,
                fillColor: AppColors.cardBackground,
                obscureText: false,
              ),
              const SizedBox(height: 15),
              IntlPhoneField(
                controller: phoneController,
                obscureText: false,
                initialCountryCode: 'TN',
                disableLengthCheck: false,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                ),
                dropdownTextStyle: const TextStyle(
                  color: AppColors.textSecondary,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  labelStyle: const TextStyle(color: AppColors.textPrimary),
                  contentPadding: const EdgeInsets.all(16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.cardBackground),
                  ),
                  fillColor: AppColors.cardBackground,
                  filled: true,
                  hintText: 'Numéro de téléphone',
                  hintStyle: const TextStyle(color: AppColors.textPrimary),
                ),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                labelText: 'Mot de passe',
                controller: passwordController,
                fillColor: AppColors.cardBackground,
                obscureText: !isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              const Text(
                "Le mot de passe doit comporter au moins 8 caractères et inclure 1 lettre majuscule et 1 symbole",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Confirmez le mot de passe',
                controller: confirmPasswordController,
                fillColor: AppColors.cardBackground,
                obscureText: !isPasswordVisible,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Checkbox(
                    checkColor: AppColors.textPrimary,
                    activeColor: AppColors.cardBackground,
                    autofocus: true,
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        isSelected = value;
                      });
                    },
                  ),
                  const Text(
                    'Accepter les termes de conditions',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                backgroundColor:
                    isLoading ? AppColors.cardBackground : AppColors.primary,
                textColor: AppColors.textPrimary,
                text: isLoading ? 'Chargement...' : 'Créer un compte',
                fontFamily: 'BebasNeue',
                borderRadius: 0,
                onPressed: isLoading ? () {} : createAccount,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          builder: (context) => const LoginPage(),
                        ),
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
      ),
    );
  }
}
