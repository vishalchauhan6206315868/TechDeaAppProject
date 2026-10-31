import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _entranceController;
  late AnimationController _pulseController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _pulseAnimation;

  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();

    // 1. Entrance animation (Logo pop-in and text slide)
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scaleAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutBack),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.4, 0.95, curve: Curves.easeOutCubic),
      ),
    );

    // 2. Continuous ambient pulse animation for purple glow
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _entranceController.forward();

    // 3. Navigate after 2.8 seconds
    _navigationTimer = Timer(const Duration(milliseconds: 2800), _goToHome);
  }

  void _goToHome() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 650),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _entranceController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoSize = (size.width * 0.38).clamp(130.0, 180.0);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: [
          // 1. Deep futuristic background gradient & ambient radial lighting
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF06060D),
                    Color(0xFF0B0A17),
                    Color(0xFF140D24),
                    Color(0xFF07060E),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // Ambient Purple Orb Top Center
          Positioned(
            top: -60,
            right: -40,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryPurple.withValues(alpha: 0.12),
              ),
            ),
          ),

          // Ambient Purple Orb Bottom Center
          Positioned(
            bottom: -80,
            left: -40,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.deepPurple.withValues(alpha: 0.14),
              ),
            ),
          ),

          // 2. Central Content (Logo + Brand Title + Tagline)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Glowing Logo
                AnimatedBuilder(
                  animation: Listenable.merge(
                      [_entranceController, _pulseController]),
                  builder: (context, child) {
                    final pulse = _pulseAnimation.value;
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: Container(
                          width: logoSize,
                          height: logoSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primaryPurple
                                    .withValues(alpha: 0.5 * pulse),
                                blurRadius: 32 * pulse,
                                spreadRadius: 4 * pulse,
                              ),
                              BoxShadow(
                                color: AppTheme.electricViolet
                                    .withValues(alpha: 0.25 * pulse),
                                blurRadius: 48 * pulse,
                                spreadRadius: 6 * pulse,
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
                      ),
                    );
                  },
                ),

                const SizedBox(height: 32),

                // Animated Brand Name & Tagline
                AnimatedBuilder(
                  animation: _entranceController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _slideAnimation.value),
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: Column(
                          children: [
                            // "TECHDEA" with Silver & Purple Chrome Gradient
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [
                                  Color(0xFFFFFFFF),
                                  Color(0xFFE2E4EC),
                                  Color(0xFFC77DFF),
                                  Color(0xFF9D4EDD),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              child: const Text(
                                "TECHDEA",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 6.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            // Subtitle Tagline
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "INNOVATE",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2.2,
                                    color: AppTheme.silverMuted
                                        .withValues(alpha: 0.9),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  width: 4,
                                  height: 4,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.electricViolet,
                                  ),
                                ),
                                Text(
                                  "CREATE",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2.2,
                                    color: AppTheme.silverMuted
                                        .withValues(alpha: 0.9),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  width: 4,
                                  height: 4,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.electricViolet,
                                  ),
                                ),
                                Text(
                                  "ELEVATE",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2.2,
                                    color: AppTheme.silverMuted
                                        .withValues(alpha: 0.9),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // 3. Bottom Tech Progress Bar & Version Info
          Positioned(
            left: 0,
            right: 0,
            bottom: 36,
            child: AnimatedBuilder(
              animation: _entranceController,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Column(
                    children: [
                      // Sleek glowing progress indicator
                      Container(
                        width: 140,
                        height: 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withValues(alpha: 0.08),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const LinearProgressIndicator(
                            backgroundColor: Colors.transparent,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppTheme.primaryPurple,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "v1.0.0 • TechDea",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          color: AppTheme.silverMuted.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
