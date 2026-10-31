import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(66);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.surface.withValues(alpha: 0.95),
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
            child: const Icon(
              Icons.menu_rounded,
              color: AppTheme.silverChrome,
              size: 20,
            ),
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.primaryPurple,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryPurple.withValues(alpha: 0.4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Tech',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                  children: [
                    TextSpan(
                      text: 'Dea',
                      style: TextStyle(
                        color: AppTheme.electricViolet,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Ideas Into Technologies',
                style: TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.silverMuted.withValues(alpha: 0.8),
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        // Brochure Download Button
        IconButton(
          tooltip: 'Download Brochure PDF',
          icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.primaryPurple.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppTheme.primaryPurple.withValues(alpha: 0.35),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.picture_as_pdf_outlined,
                  color: AppTheme.electricViolet,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text(
                  'Brochure',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.electricViolet,
                  ),
                ),
              ],
            ),
          ),
          onPressed: () {
            ApiService.launchWebUrl('https://www.techdea.in/brochure.pdf');
          },
        ),
        const SizedBox(width: 8),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.white.withValues(alpha: 0.06),
          height: 1,
        ),
      ),
    );
  }
}

