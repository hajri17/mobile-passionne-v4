import 'package:flutter/material.dart';
import 'package:passione_app/widget/colors_page.dart';

Widget buildHeader(String title, String subtitle) {
  return Container(
    height: (subtitle != '') ? 175 : 125,
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(0.04, -2.25),
        end: Alignment(0.44, 1.13),
        colors: [
          Color(0xFF629F3F),
          Color(0xFF121212),
        ],
      ),
    ),
    child: Column(
      crossAxisAlignment: (subtitle != '')
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisAlignment:
          (subtitle != '') ? MainAxisAlignment.end : MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "BebasNeue",
          ),
        ),
        if (subtitle != '')
          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
          ),
      ],
    ),
  );
}

class CustomAppBarWithSideMenu extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;

  const CustomAppBarWithSideMenu({
    Key? key,
    required this.onMenuPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      elevation: 0,
      title: Row(
        children: [
          const SizedBox(width: 10),
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(
              'assets/images/ess_logo.png',
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FOULEN BEN FOULEN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'BebasNeue',
                ),
              ),
              Text(
                'Username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'BebasNeue',
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: const Text(
              'JAM3ITY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'BebasNeue',
                fontWeight: FontWeight.bold,
                height: .1,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: onMenuPressed,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double padding;
  final IconData? icon;

  const CustomButton({
    Key? key,
    this.fontSize = 16,
    required this.text,
    this.fontFamily = 'Manrope',
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.primary,
    this.borderRadius = 8.0,
    this.padding = 10.0,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, color: textColor),
          if (icon != null) const SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: fontFamily,
              letterSpacing: 1.5,
              height: .1,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final bool enabled;
  final InputBorder? border;
  final Color? fillColor;
  final bool autofocus;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.hintText = '',
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.enabled = true,
    this.border,
    this.fillColor,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      enabled: enabled,
      autofocus: autofocus,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.all(14),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 12,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(color: AppColors.textPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        filled: fillColor != null,
        fillColor: fillColor,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const CustomText({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: 1,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 12,
        ),
      ),
    );
  }
}

Widget matchCard(String team1, String score1, String score2, String team2,
    String status, String homeAway) {
  Color color = AppColors.cardBackground;
  String stringStatus = '';
  if (status == 'win') {
    color = const Color(0xFF417921);
    stringStatus = 'W';
  } else if (status == 'lose') {
    color = const Color(0xFF530003);
    stringStatus = 'L';
  } else if (status == 'drow') {
    color = const Color(0xFFE98601);
    stringStatus = 'D';
  } else if (status == '') {
    color = const Color(0xFF353535);
    stringStatus = 'N';
  }
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "JOURNÉE 16",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontFamily: 'BebasNeue',
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            "10/02/2025",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
              fontFamily: 'BebasNeue',
            ),
          ),
          const Spacer(),
          Container(
            width: 25,
            height: 25,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: color,
            ),
            child: Text(
              stringStatus,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(top: 5, bottom: 15),
        child: Row(
          children: [
            // First part (Team 1 + Logo)
            Expanded(
              child: Container(
                height: 69,
                color: (homeAway == 'away') ? AppColors.cardBackground : color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      team1,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/ess_logo.png',
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),

            // Score in the center
            Container(
                height: 69,
                width: 69,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: (homeAway == 'away')
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    end: (homeAway == 'away')
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    colors: [
                      color,
                      color,
                      AppColors.cardBackground,
                      AppColors.cardBackground,
                    ],
                    stops: const [
                      0.0,
                      0.5,
                      0.5,
                      1.0,
                    ],
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$score1 ",
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: (score1 == '') ? " - " : "  ",
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: " $score2",
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),

            // Second part (Logo + Team 2 with green background)
            Expanded(
              child: Container(
                height: 69,
                color: (homeAway == 'home') ? AppColors.cardBackground : color,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ess_logo.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      team2,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget matchFullDetail(String team1, String score1, String score2, String team2,
    String status, String homeAway) {
  return Column(
    children: [
      const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "JOURNÉE 16",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontFamily: 'BebasNeue',
            ),
          ),
          SizedBox(width: 5),
          Text(
            "10/02/2025",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
              fontFamily: 'BebasNeue',
            ),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            // First part (Team 1 + Logo)
            Expanded(
              child: Container(
                height: 69,
                color: (homeAway == 'away')
                    ? AppColors.cardBackground
                    : AppColors.background,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      team1,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/ess_logo.png',
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),

            // Score in the center
            Container(
                height: 69,
                width: 69,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: (homeAway == 'away')
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    end: (homeAway == 'away')
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    colors: [
                      AppColors.background,
                      AppColors.background,
                      AppColors.cardBackground,
                      AppColors.cardBackground,
                    ],
                    stops: const [
                      0.0,
                      0.5,
                      0.5,
                      1.0,
                    ],
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$score1 ",
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: (score1 == '') ? " - " : "  ",
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: " $score2",
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),

            // Second part (Logo + Team 2 with green background)
            Expanded(
              child: Container(
                height: 69,
                color: (homeAway == 'home')
                    ? AppColors.cardBackground
                    : AppColors.background,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ess_logo.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      team2,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(right: 8, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '+10 PTS ',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFFF9F9F9),
                fontSize: 24,
                fontFamily: 'BebasNeue',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget matchFixedCard(context, String team1, String team2, String homeAway) {
  Color color = AppColors.cardBackground;
  color = const Color(0xFF353535);

  return Container(
    padding: const EdgeInsets.only(right: 8),
    width: 320,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: const BoxDecoration(
            color: AppColors.background,
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CHAMPIONAT DE TUNISIE DE FOOTBALL',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "BebasNeue",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Journée 1',
                style: TextStyle(
                  color: Color(0xFFD6D5D5),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            // First part (Team 1 + Logo)
            Expanded(
              child: Container(
                height: 69,
                color: (homeAway == 'away')
                    ? AppColors.cardBackground
                    : const Color(0xFF353535),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      team1,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/ess_logo.png',
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),

            // Score in the center
            Container(
              height: 69,
              width: 69,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: (homeAway == 'away')
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  end: (homeAway == 'away')
                      ? Alignment.bottomLeft
                      : Alignment.bottomRight,
                  colors: [
                    color,
                    color,
                    AppColors.cardBackground,
                    AppColors.cardBackground,
                  ],
                  stops: const [
                    0.0,
                    0.5,
                    0.5,
                    1.0,
                  ],
                ),
              ),
              child: const Text(
                " - ",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            // Second part (Logo + Team 2 with green background)
            Expanded(
              child: Container(
                height: 69,
                color: (homeAway == 'home') ? AppColors.cardBackground : color,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ess_logo.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      team2,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: const BoxDecoration(
            color: AppColors.background,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/league.png",
                width: 26,
                height: 28,
              ),
              const SizedBox(width: 10),
              const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FINALS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Best of 3',
                    style: TextStyle(
                      color: Color(0xFFD6D5D5),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
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

Widget tableHeaderCell(String text) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget tableCell(String text) {
  return Center(
    heightFactor: 3,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 10,
      ),
    ),
  );
}

Widget playerCell(String team, String logo, String name) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 14,
    ),
    child: Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              logo,
              width: 25,
              height: 25,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                team,
                width: 10,
              ),
            )
          ],
        ),
        const SizedBox(width: 8),
        Text(
          name,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

Widget teamCell(String logo, String name) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 4,
      vertical: 14,
    ),
    child: Row(
      children: [
        Image.asset(
          logo,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 10,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildStatColumn(String title, String value, String subtitle) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 10,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'BebasNeue',
        ),
      ),
      Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 10,
        ),
      ),
    ],
  );
}

Widget buildInfoRow(String title, String value, [String? imageUrl]) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.greyBackground,
          width: .5,
        ),
      ),
    ),
    child: Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 10,
          ),
        ),
        const Spacer(),
        if (imageUrl != null)
          Image.asset(
            imageUrl,
            width: 20,
            height: 20,
          ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget buildImage(String imageUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.asset(
      imageUrl,
      fit: BoxFit.cover,
    ),
  );
}
