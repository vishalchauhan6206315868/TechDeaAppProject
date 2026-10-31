import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      _FeatureItem(
        title: "600+ Students Mentored",
        description:
            "Helping students and professionals build technical skills through practical learning.",
        icon: Icons.school_outlined,
        accentColor: AppTheme.primaryPurple,
      ),
      _FeatureItem(
        title: "Real-World Projects",
        description:
            "Gain hands-on experience by working on industry-oriented live projects.",
        icon: Icons.code_rounded,
        accentColor: AppTheme.cyanAccent,
      ),
      _FeatureItem(
        title: "Latest Technologies",
        description:
            "Learn React, MERN, Python, AI, Cloud Computing, DevOps and more.",
        icon: Icons.memory_rounded,
        accentColor: AppTheme.electricViolet,
      ),
      _FeatureItem(
        title: "Beginner Friendly",
        description:
            "Easy-to-follow guidance for school students, college students and freshers.",
        icon: Icons.sentiment_very_satisfied_rounded,
        accentColor: AppTheme.amberAccent,
      ),
      _FeatureItem(
        title: "Career Growth",
        description:
            "Resume building, portfolio development, mock interviews and placement support.",
        icon: Icons.trending_up_rounded,
        accentColor: const Color(0xFF00E676),
      ),
      _FeatureItem(
        title: "Lifetime Support",
        description:
            "Continuous mentorship and technical guidance even after training completion.",
        icon: Icons.support_agent_rounded,
        accentColor: const Color(0xFFFF5252),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        const Text(
          "WHY CHOOSE TECHDEA",
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.8,
            color: AppTheme.electricViolet,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Building Skills.\nCreating Opportunities.",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppTheme.silverChrome,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "We combine innovation, practical learning and modern technology to help students, startups and businesses achieve long-term success.",
          style: TextStyle(
            fontSize: 12.5,
            height: 1.45,
            color: AppTheme.silverMuted.withValues(alpha: 0.85),
          ),
        ),

        const SizedBox(height: 18),

        // List of Features
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: features.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = features[index];
            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.06),
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: item.accentColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      item.icon,
                      color: item.accentColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.silverChrome,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 11.5,
                            height: 1.35,
                            color: AppTheme.silverMuted.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _FeatureItem {
  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;

  const _FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
  });
}

