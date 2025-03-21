import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class GameRoulePage extends StatefulWidget {
  const GameRoulePage({super.key});

  @override
  State<GameRoulePage> createState() => _GameRoulePageState();
}

class _GameRoulePageState extends State<GameRoulePage> {
  String? htmlContent;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await ApiService.get('/gamerules');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          htmlContent = data[0]['content'];
          isLoading = false;
        });
      } else {
        print('Failed to load content: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildHeader(
            'Règles des jeux',
            "Protecteur ultime du but. Sa principale responsabilité est d'empêcher le ballon de pénétrer dans les filets.",
          ),
          isLoading
              ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Le contenu des règles du jeu sera affiché ici.',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Html(
                    data: htmlContent, // Renders the HTML content
                  ),
                ),
        ],
      ),
    );
  }
}
