import 'package:flutter/material.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              'Notifications',
              "Protecteur ultime du but. Sa principale responsabilité est d'empêcher le ballon de pénétrer dans les filets.",
            ),
            const SizedBox(height: 18),
            const NotificationSection(),
          ],
        ),
      ),
    );
  }
}

class NotificationSection extends StatefulWidget {
  const NotificationSection({super.key});

  @override
  State<NotificationSection> createState() => _NotificationSectionState();
}

class _NotificationSectionState extends State<NotificationSection> {
  bool switchValue1 = true;
  bool switchValue2 = false;
  bool switchEmail = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          SwitchListTile(
            value: switchValue1,
            onChanged: (bool? value) {
              setState(() {
                switchValue1 = value!;
              });
            },
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
            title: const Text(
              'Passionné',
              style: TextStyle(
                color: AppColors.textPrimary,
              ),
            ),
            subtitle: const Text(
              'Tout les notifications pour passionné.',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const Divider(),
          SwitchListTile(
            value: switchValue2,
            onChanged: (bool? value) {
              setState(() {
                switchValue2 = value!;
              });
            },
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
            title: const Text(
              'Tikitaka',
              style: TextStyle(
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const Divider(),
          SwitchListTile(
            value: switchEmail,
            onChanged: (bool? value) {
              setState(() {
                switchEmail = value!;
              });
            },
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
            title: const Text(
              'Email',
              style: TextStyle(
                color: AppColors.textPrimary,
              ),
            ),
            subtitle: const Text(
              'Newsletter nous meilleures offres et actualités.',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
