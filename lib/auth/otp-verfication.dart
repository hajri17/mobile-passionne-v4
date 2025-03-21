import 'dart:async';
import 'package:flutter/material.dart';
import 'package:passione_app/auth/login.dart';
import 'package:passione_app/auth/new-password.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/widget/widget_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:passione_app/widget/colors_page.dart';

class OtpVerificationPage extends StatefulWidget {
  final String origin;
  final String phoneNumber;
  const OtpVerificationPage(
      {super.key, required this.origin, required this.phoneNumber});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TextEditingController otpController = TextEditingController();
  bool isButtonEnabled = false;
  int countdown = 30;
  late Timer timer;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void verifyOtp() async {
    String otp = otpController.text.trim();

    setState(() {
      isLoading = true;
    });

    try {
      var res = await ApiService.postWithoutToken(
        'auth/verify-otp',
        {
          "telephone": widget.phoneNumber,
          "otp": otp,
        },
      );
      print('resulat : ${res.body}');

      if (!mounted) return;

      if (res.statusCode == 200) {
        if (widget.origin == 'signup') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NewPasswordPage(),
            ),
          );
        }
      } else {
        // Afficher une erreur
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            content: Text("Code OTP incorrect"),
            backgroundColor: Colors.red,
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
          content: Text("Erreur lors de la vérification"),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  void resendOtp() async {
    setState(() {
      isLoading = true;
    });

    try {
      var res = await ApiService.post(
        'auth/resend-otp',
        {
          "phone": widget.phoneNumber,
        },
      );

      if (res.statusCode == 200) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            content: Text("Un nouveau code OTP a été envoyé"),
            backgroundColor: Colors.green,
          ),
        );
        startCountdown();
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            content: Text("Échec de l'envoi du code OTP"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Text("Erreur de connexion"),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  Timer? countdownTimer;

  void startCountdown() {
    setState(() {
      countdown = 30; // Réinitialiser le timer à 30 secondes
    });

    countdownTimer?.cancel(); // Annuler l'ancien timer s'il existe

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel(); // Arrêter le timer quand countdown atteint 0
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    otpController.dispose();
    super.dispose();
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
                "Vérification OTP",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BebasNeue',
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Veuillez vérifier votre boîte de réception",
                style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
              ),
              const Text(
                "vous devriez avoir reçu un code de mot de passe à usage unique",
                style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
              const SizedBox(height: 75),
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: otpController,
                keyboardType: TextInputType.number,
                obscureText: false,
                animationType: AnimationType.fade,
                textStyle:
                    const TextStyle(color: AppColors.textPrimary, fontSize: 20),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(0),
                  fieldHeight: 75,
                  fieldWidth: 75,
                  activeFillColor: AppColors.cardBackground,
                  inactiveFillColor: AppColors.cardBackground,
                  selectedFillColor: AppColors.cardBackground.withOpacity(0.5),
                  activeColor: AppColors.cardBackground,
                  inactiveColor: AppColors.cardBackground,
                  selectedColor: AppColors.primary,
                ),
                enableActiveFill: true,
                onChanged: (value) {
                  setState(() {
                    isButtonEnabled = value.length == 4;
                  });
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                backgroundColor: isButtonEnabled
                    ? AppColors.primary
                    : AppColors.cardBackground,
                textColor: AppColors.textPrimary,
                text: 'VÉRIFIER',
                fontFamily: 'BebasNeue',
                borderRadius: 0,
                onPressed: isButtonEnabled ? verifyOtp : () {},
              ),
              TextButton(
                onPressed: countdown == 0 ? resendOtp : null,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    countdown == 0
                        ? "Renvoyer le code"
                        : "Vous n'avez pas reçu votre code ?",
                    style: TextStyle(
                      color: countdown == 0
                          ? AppColors.primary
                          : AppColors.cardBackground,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 75),
              if (countdown > 0)
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "$countdown S",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
