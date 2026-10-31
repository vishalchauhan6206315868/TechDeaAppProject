import 'package:flutter/material.dart';
import '../models/stats_model.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';
import '../widgets/cta_section.dart';
import '../widgets/hero_banner.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_footer.dart';
import '../widgets/portals_section.dart';
import '../widgets/stats_section.dart';
import '../widgets/techdea_drawer.dart';
import '../widgets/why_choose_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StatsModel _stats = StatsModel.fallback();
  bool _isLoadingStats = true;

  @override
  void initState() {
    super.initState();
    _fetchStats();
  }

  Future<void> _fetchStats() async {
    setState(() => _isLoadingStats = true);
    final stats = await ApiService.getStats();
    if (mounted) {
      setState(() {
        _stats = stats;
        _isLoadingStats = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const HomeAppBar(),
      drawer: const TechDeaDrawer(),
      body: RefreshIndicator(
        color: AppTheme.electricViolet,
        backgroundColor: AppTheme.surface,
        onRefresh: _fetchStats,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Hero Section
              const HeroBanner(),

              const SizedBox(height: 26),

              // 2. TechDea Portals (Semester, LMS, Trainings, Verification)
              const PortalsSection(),

              const SizedBox(height: 26),

              // 3. Dynamic Stats Section (API-connected)
              StatsSection(
                stats: _stats,
                isLoading: _isLoadingStats,
              ),

              const SizedBox(height: 26),

              // 4. Why Choose TechDea (6 Core Highlights)
              const WhyChooseSection(),

              const SizedBox(height: 26),

              // 5. Call To Action (CTA Banner + Rate Us)
              const CtaSection(),

              const SizedBox(height: 26),

              // 6. Community & Footer
              const HomeFooter(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Chat on WhatsApp',
        backgroundColor: const Color(0xFF25D366),
        elevation: 6,
        child: const Icon(
          Icons.chat_bubble_rounded,
          color: Colors.white,
          size: 24,
        ),
        onPressed: () {
          ApiService.launchWebUrl(
              "https://whatsapp.com/channel/0029VbD90E2IyPtMvouUGP0w");
        },
      ),
    );
  }
}
