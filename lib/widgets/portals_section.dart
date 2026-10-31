import 'package:flutter/material.dart';
import '../models/portal_model.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';

class PortalsSection extends StatelessWidget {
  const PortalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final portals = PortalModel.defaultPortals;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "PORTALS & ECOSYSTEM",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.8,
                    color: AppTheme.electricViolet,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  "Quick Access Hub",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.silverChrome,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
              child: const Text(
                "4 Portals",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.silverMuted,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // 2x2 Grid of Portals
        GridView.builder(
          itemCount: portals.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) {
            final portal = portals[index];
            return _buildPortalCard(portal);
          },
        ),
      ],
    );
  }

  Widget _buildPortalCard(PortalModel portal) {
    return InkWell(
      onTap: () => ApiService.launchWebUrl(portal.url),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: portal.primaryColor.withValues(alpha: 0.25),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: portal.primaryColor.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Row with Icon and Tag
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: portal.primaryColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: portal.primaryColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Icon(
                    portal.icon,
                    color: portal.primaryColor,
                    size: 20,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    portal.tag,
                    style: TextStyle(
                      fontSize: 8.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: portal.primaryColor,
                    ),
                  ),
                ),
              ],
            ),

            // Title and Subtitle
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  portal.title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.silverChrome,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  portal.subtitle,
                  style: TextStyle(
                    fontSize: 10.5,
                    height: 1.3,
                    color: AppTheme.silverMuted.withValues(alpha: 0.8),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

            // Bottom Open Action Indicator
            Row(
              children: [
                Text(
                  "Open Portal",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: portal.primaryColor,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.open_in_new_rounded,
                  size: 11,
                  color: portal.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

