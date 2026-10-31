import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: AppTheme.heroGradient,
        border: Border.all(
          color: AppTheme.primaryPurple.withValues(alpha: 0.35),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryPurple.withValues(alpha: 0.2),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background ambient glow circles
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryPurple.withValues(alpha: 0.15),
              ),
            ),
          ),
          Positioned(
            left: -30,
            bottom: -30,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.electricViolet.withValues(alpha: 0.12),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Tagline Badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryPurple.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppTheme.electricViolet.withValues(alpha: 0.45),
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_awesome_rounded,
                        color: AppTheme.electricViolet,
                        size: 13,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "WHERE TECHNOLOGY MEETS INNOVATION",
                        style: TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.1,
                          color: AppTheme.electricViolet,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Main Heading
                RichText(
                  text: const TextSpan(
                    text: 'Build Your\n',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      height: 1.25,
                      color: AppTheme.silverChrome,
                      letterSpacing: 0.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Digital Future\n',
                        style: TextStyle(
                          color: AppTheme.electricViolet,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: 'With TechDea',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Description
                Text(
                  "Transform your ideas into innovative digital products through modern software development, Artificial Intelligence, cloud solutions, and industry-ready professional training.",
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: AppTheme.silverMuted.withValues(alpha: 0.9),
                  ),
                ),

                const SizedBox(height: 22),

                // Action Buttons
                Row(
                  children: [
                    // Contact Us Button
                    Expanded(
                      flex: 6,
                      child: InkWell(
                        onTap: () {
                          ApiService.launchWebUrl(
                              "https://www.techdea.in/contact");
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          decoration: BoxDecoration(
                            gradient: AppTheme.primaryGradient,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primaryPurple
                                    .withValues(alpha: 0.35),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Contact Us",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Know More Button
                    Expanded(
                      flex: 5,
                      child: OutlinedButton(
                        onPressed: () {
                          ApiService.launchWebUrl(
                              "https://www.techdea.in/about");
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          side: BorderSide(
                            color: Colors.white.withValues(alpha: 0.25),
                            width: 1.2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.white.withValues(alpha: 0.04),
                        ),
                        child: const Text(
                          "Know More",
                          style: TextStyle(
                            color: AppTheme.silverChrome,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
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
}

