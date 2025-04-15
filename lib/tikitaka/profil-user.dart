import 'package:flutter/material.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              'Paramètres du profil',
              "Protecteur ultime du but. Sa principale responsabilité est d'empêcher le ballon de pénétrer dans les filets.",
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black,
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  const Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundImage: NetworkImage(
                              'https://storage.googleapis.com/a1aa/image/armDFWyqtbZ6wOIe7dDZkb2ZCG3uVB5Vo9aV_7D4-98.jpg'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(Icons.camera_alt, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  buildTextField('NOM & PRÉNOM', 'Chiheb Mouelhi'),
                  buildTextField('EMAIL', 'chihebmouelhi@gmail.com'),
                  buildTextField('Mot de passe', '********', isPassword: true),
                  buildTextField('DATE', '23/05/1995'),
                  buildTextField('PAYS/RÉGION', 'Tunisie, Sousse'),
                  const SizedBox(height: 16.0),
                  CustomButton(
                    backgroundColor: AppColors.primary,
                    textColor: AppColors.textPrimary,
                    text: 'ENREGISTRER',
                    fontFamily: 'BebasNeue',
                    borderRadius: 0,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String placeholder,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontFamily: "BebasNeue",
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            obscureText: isPassword ? !_isPasswordVisible : false,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.cardBackground,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(10),
              hintText: placeholder,
              hintStyle: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    )
                  : null,
            ),
            style: const TextStyle(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
