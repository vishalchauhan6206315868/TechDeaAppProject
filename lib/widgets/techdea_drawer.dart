import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';

class TechDeaDrawer extends StatelessWidget {
  const TechDeaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header with Logo and Brand Details
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryPurple.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.primaryPurple,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryPurple.withValues(alpha: 0.4),
                          blurRadius: 12,
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
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: 'Tech',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 1.1,
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
                        const SizedBox(height: 2),
                        Text(
                          'Converts Ideas Into Technologies',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppTheme.silverMuted.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Navigation Links
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                children: [
                  _buildSectionHeader("PORTALS & EDUCATION"),
                  _buildDrawerItem(
                    icon: Icons.school_rounded,
                    title: "Semesters Portal",
                    subtitle: "Diploma / BTEUP Prep",
                    color: AppTheme.primaryPurple,
                    onTap: () {
                      Navigator.pop(context);
                      ApiService.launchWebUrl("https://semester.techdea.in/");
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.auto_stories_rounded,
                    title: "TechDea LMS",
                    subtitle: "Courses & Assignments",
                    color: AppTheme.electricViolet,
                    onTap: () {
                      Navigator.pop(context);
                      ApiService.launchWebUrl("https://lms.techdea.in/");
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.terminal_rounded,
                    title: "Trainings & Internships",
                    subtitle: "Live Project Training",
                    color: AppTheme.cyanAccent,
                    onTap: () {
                      Navigator.pop(context);
                      ApiService.launchWebUrl("https://learn.techdea.in/");
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.verified_user_rounded,
                    title: "Verify Certificate",
                    subtitle: "Validate Credentials",
                    color: AppTheme.amberAccent,
                    onTap: () {
                      Navigator.pop(context);
                      ApiService.launchWebUrl("https://verification.techdea.in/");
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildSectionHeader("SERVICES & COMPANY"),
                  _buildDrawerItem(
                    icon: Icons.code_rounded,
                    title: "Services & Development",
                    subtitle: "Web, AI & Cloud Solutions",
                    color: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                      ApiService.launchWebUrl("https://www.techdea.in/services");
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.rocket_launch_rounded,
                    title: "Projects & Portfolio",
                    subtitle: "Case Studies & Products",
                    color: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                      ApiService.launchWebUrl("https://www.techdea.in/projects");
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.info_outline_rounded,
                    title: "About TechDea",
                    subtitle: "Mission, Vision & Team",
                    color: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                      ApiService.launchWebUrl("https://www.techdea.in/about");
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.headset_mic_rounded,
                    title: "Contact Us",
                    subtitle: "Get in touch with us",
                    color: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                      ApiService.launchWebUrl("https://www.techdea.in/contact");
                    },
                  ),
                ],
              ),
            ),

            // Bottom Drawer Actions
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      ApiService.launchWebUrl(
                          "https://whatsapp.com/channel/0029VbD90E2IyPtMvouUGP0w");
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 11),
                      decoration: BoxDecoration(
                        color: const Color(0xFF25D366).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF25D366).withValues(alpha: 0.4),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline_rounded,
                            color: Color(0xFF25D366),
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Join WhatsApp Channel",
                            style: TextStyle(
                              color: Color(0xFF25D366),
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "© 2026 TechDea. All Rights Reserved.",
                    style: TextStyle(
                      fontSize: 10,
                      color: AppTheme.silverMuted.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.5,
          color: AppTheme.silverMuted,
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppTheme.silverChrome,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 11,
          color: AppTheme.silverMuted.withValues(alpha: 0.7),
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        size: 18,
        color: AppTheme.silverMuted,
      ),
    );
  }
}

