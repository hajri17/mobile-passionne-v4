import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:passione_app/auth/login.dart';
import 'package:passione_app/auth/otp-verfication.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/widget/widget_page.dart';
import 'package:passione_app/widget/colors_page.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final phoneController = TextEditingController();
  bool isLoading = false;

  void forgetPassword() async {
    String phone = phoneController.text.trim();

    setState(() {
      isLoading = true;
    });

    try {
      var res = await ApiService.post(
        'auth/forget-password',
        {
          "phone": phone,
        },
      );

      if (!mounted) return;

      if (res.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerificationPage(
              origin: 'forget-password',
              phoneNumber: phone,
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
          content: Text("Numéro de téléphone n'existe pas."),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Text(
                "Changer le mot de passe",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BebasNeue',
                ),
              ),
              const SizedBox(height: 100),
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
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.cardBackground),
                  ),
                  fillColor: AppColors.cardBackground,
                  filled: true,
                  hintText: 'Numéro de téléphone',
                  hintStyle: const TextStyle(color: AppColors.textPrimary),
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                backgroundColor:
                    isLoading ? AppColors.cardBackground : AppColors.primary,
                textColor: AppColors.textPrimary,
                text: isLoading ? 'Chargement...' : 'Obtenir le code',
                fontFamily: 'BebasNeue',
                borderRadius: 0,
                onPressed: isLoading ? () {} : forgetPassword,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
