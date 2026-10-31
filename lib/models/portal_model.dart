import 'package:flutter/material.dart';

class PortalModel {
  final String title;
  final String subtitle;
  final String tag;
  final String url;
  final IconData icon;
  final Color primaryColor;

  const PortalModel({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.url,
    required this.icon,
    required this.primaryColor,
  });

  static List<PortalModel> get defaultPortals => const [
        PortalModel(
          title: "Semesters Portal",
          subtitle: "BTEUP & Diploma classes, notes & exam prep",
          tag: "ACADEMIC",
          url: "https://semester.techdea.in/",
          icon: Icons.school_rounded,
          primaryColor: Color(0xFF9D4EDD),
        ),
        PortalModel(
          title: "TechDea LMS",
          subtitle: "Structured tech courses & assignments",
          tag: "LEARNING",
          url: "https://lms.techdea.in/",
          icon: Icons.auto_stories_rounded,
          primaryColor: Color(0xFFC77DFF),
        ),
        PortalModel(
          title: "Trainings Portal",
          subtitle: "Workshops, AI & Web Dev internships",
          tag: "TRAINING",
          url: "https://learn.techdea.in/",
          icon: Icons.terminal_rounded,
          primaryColor: Color(0xFF00E5FF),
        ),
        PortalModel(
          title: "Verify Certificate",
          subtitle: "Check authenticity of completion certificates",
          tag: "VERIFICATION",
          url: "https://verification.techdea.in/",
          icon: Icons.verified_user_rounded,
          primaryColor: Color(0xFFFFB703),
        ),
      ];
}

