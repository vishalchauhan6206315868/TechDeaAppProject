import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Column(
        children: [
          // WhatsApp Channel Highlight Card
          InkWell(
            onTap: () {
              ApiService.launchWebUrl(
                  "https://whatsapp.com/channel/0029VbD90E2IyPtMvouUGP0w");
            },
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF25D366).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFF25D366).withValues(alpha: 0.35),
                ),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFF25D366),
                    child: Icon(
                      Icons.chat_bubble_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Join TechDea WhatsApp Channel",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Get latest batch updates, notes & job alerts",
                          style: TextStyle(
                            fontSize: 10.5,
                            color: AppTheme.silverMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xFF25D366),
                    size: 14,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // TechDea Mini Branding
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(width: 8),
              const Text(
                "TECHDEA",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  color: AppTheme.silverChrome,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Social Icon Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(
                icon: Icons.language_rounded,
                tooltip: "Official Website",
                url: "https://www.techdea.in",
              ),
              _buildSocialButton(
                icon: Icons.mail_outline_rounded,
                tooltip: "Email Us",
                url: "mailto:techdeaofficial@gmail.com",
              ),
              _buildSocialButton(
                icon: Icons.chat_rounded,
                tooltip: "WhatsApp Community",
                url: "https://whatsapp.com/channel/0029VbD90E2IyPtMvouUGP0w",
              ),
              _buildSocialButton(
                icon: Icons.terminal_rounded,
                tooltip: "Semesters Portal",
                url: "https://semester.techdea.in",
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Copyright
          Text(
            "© 2026 TechDea. All Rights Reserved.\nConverts Ideas Into Technologies",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.5,
              height: 1.5,
              color: AppTheme.silverMuted.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String tooltip,
    required String url,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: IconButton(
        tooltip: tooltip,
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Icon(icon, color: AppTheme.silverChrome, size: 16),
        ),
        onPressed: () => ApiService.launchWebUrl(url),
      ),
    );
  }
}

