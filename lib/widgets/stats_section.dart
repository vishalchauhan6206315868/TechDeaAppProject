import 'package:flutter/material.dart';
import '../models/stats_model.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';

class StatsSection extends StatelessWidget {
  final StatsModel stats;
  final bool isLoading;

  const StatsSection({
    super.key,
    required this.stats,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "PROVEN TRACK RECORD",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.8,
                    color: AppTheme.electricViolet,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  "TechDea In Numbers",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.silverChrome,
                  ),
                ),
              ],
            ),
            if (isLoading)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppTheme.electricViolet),
                ),
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.green.withValues(alpha: 0.3),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.greenAccent,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "LIVE DATA",
                      style: TextStyle(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),

        const SizedBox(height: 14),

        // 4 Stats Cards in 2x2 Grid
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                count: stats.services.contains('+')
                    ? stats.services
                    : "${stats.services}+",
                label: "Services Offered",
                actionText: "Explore",
                icon: Icons.design_services_rounded,
                color: AppTheme.primaryPurple,
                onTap: () =>
                    ApiService.launchWebUrl("https://www.techdea.in/services"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                count: stats.projects.contains('+')
                    ? stats.projects
                    : "${stats.projects}+",
                label: "Projects Completed",
                actionText: "View",
                icon: Icons.rocket_launch_rounded,
                color: AppTheme.cyanAccent,
                onTap: () =>
                    ApiService.launchWebUrl("https://www.techdea.in/projects"),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                count: stats.students.contains('+')
                    ? stats.students
                    : "${stats.students}+",
                label: "Students Mentored",
                actionText: "Training",
                icon: Icons.people_alt_rounded,
                color: AppTheme.amberAccent,
                onTap: () =>
                    ApiService.launchWebUrl("https://learn.techdea.in/"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                count: stats.team.contains('+')
                    ? stats.team
                    : "${stats.team}+",
                label: "Team Members",
                actionText: "Meet Team",
                icon: Icons.groups_2_rounded,
                color: AppTheme.electricViolet,
                onTap: () =>
                    ApiService.launchWebUrl("https://www.techdea.in/about"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String count,
    required String label,
    required String actionText,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    children: [
                      Text(
                        actionText,
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: color,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 9, color: color),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            count,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppTheme.silverMuted.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}

