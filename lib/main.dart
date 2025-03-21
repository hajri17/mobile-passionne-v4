import 'package:flutter/material.dart';
import 'package:passione_app/services/api_services.dart';
import 'package:passione_app/splash_screen.dart';
import 'package:passione_app/tikitaka/about-as.dart';
import 'package:passione_app/tikitaka/blog.dart';
import 'package:passione_app/tikitaka/game-rules1.dart';
import 'package:passione_app/tikitaka/history.dart';
import 'package:passione_app/tikitaka/home.dart';
import 'package:passione_app/tikitaka/leaderboard.dart';
import 'package:passione_app/tikitaka/league-tn.dart';
import 'package:passione_app/tikitaka/notification.dart';
import 'package:passione_app/tikitaka/profil-user.dart';
import 'package:passione_app/tikitaka/quiz.dart';
import 'package:passione_app/tikitaka/terms-condition.dart';
import 'package:passione_app/tikitaka/tikitaka.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';
import 'package:passione_app/auth/landing.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ApiService.getDataFromShared('connected_jwt_token');
  runApp(MyApp(isAuthenticated: token != null));
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  const MyApp({super.key, required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passionne 12',
      theme: ThemeData(
        fontFamily: 'Manrope',
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: (!isAuthenticated) ? const LandingPage() : const SplashScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  final int initialIndex; // Accept initial index
  const MainPage({super.key, this.initialIndex = 0});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openSideMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBarWithSideMenu(
        onMenuPressed: _openSideMenu,
      ),
      body: _buildPageContent(_selectedIndex),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      shape: const Border.symmetric(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://storage.googleapis.com/a1aa/image/6Vrkoll3Vrpwv8eH2JoEX5P3PgpOboFCrZRb_EKyELk.jpg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CHIHEB MOUELHI',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "BebasNeue",
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'chi',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "BebasNeue",
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            MenuItem(
              icon: Icons.person,
              text: 'Paramètres du profil',
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(5);
              },
            ),
            MenuItem(
              icon: Icons.info,
              text: 'À propos de nous',
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(6);
              },
            ),
            MenuItem(
              icon: Icons.receipt_outlined,
              text: 'Règles des jeux',
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(7);
              },
            ),
            MenuItem(
              icon: Icons.history,
              text: 'Historique du jeu',
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(12);
              },
            ),
            MenuItem(
              icon: Icons.notifications,
              text: 'Notifications',
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(8);
              },
            ),
            MenuItem(
              icon: Icons.bookmark,
              text: 'Termes et conditions',
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(9);
              },
            ),
            MenuItem(
              icon: Icons.quiz,
              text: 'Quiz',
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(11);
              },
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: const ShapeDecoration(
                shape: Border.symmetric(
                  horizontal: BorderSide(
                    width: .3,
                    color: AppColors.greyBackground,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  ApiService.logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LandingPage(),
                    ),
                  );
                },
                child: const Text(
                  'Se déconnecter',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const LeagueClassificationPage();
      case 2:
        return const Center();
      case 3:
        return const LeaderboardPage();
      case 4:
        return const TikitakaPage();
      case 5:
        return const UserSettingsPage();
      case 6:
        return const AboutAsPage();
      case 7:
        return const GameRulesPage();
      case 8:
        return const NotificationPage();
      case 9:
        return const TermConditionPage();
      case 10:
        return const BlogPage();
      case 11:
        return const QuizPage();
      case 12:
        return const HistoriqueScreen();
      default:
        return const Center(child: Text('Page not found')); // Fallback
    }
  }
}

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: const Color(0xFF1F1F1F),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, 'assets/images/home.svg'),
          _buildNavItem(1, 'assets/images/news.svg'),
          _buildNavItem(2, 'assets/images/ball.svg'),
          _buildNavItem(3, 'assets/images/leadboard.svg'),
          _buildNavItem(4, 'assets/images/logo.svg'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String image) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == index ? AppColors.primary : AppColors.textPrimary,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String text;
  final Color textColor;
  const MenuItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    this.textColor = AppColors.textSecondary,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          shape: Border.symmetric(
            horizontal: BorderSide(
              width: .3,
              color: AppColors.greyBackground,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
