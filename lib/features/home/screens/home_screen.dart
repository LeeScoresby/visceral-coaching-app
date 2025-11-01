import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../coaching/models/coaching_session.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getMotivationalMessage() {
    final hour = DateTime.now().hour;
    final messages = {
      'morning': [
        'Cada amanecer trae\nuna nueva oportunidad',
        'Tu viaje interior\ncomienza hoy',
        'Conecta con tu esencia\nen este nuevo día',
      ],
      'afternoon': [
        'El momento presente\nes tu poder',
        'Transforma tu vida\ndesde dentro',
        'Tu potencial\nes infinito',
      ],
      'evening': [
        'Reflexiona y renueva\ntu energía',
        'La calma está\ndentro de ti',
        'Cierra el día con\nintención y gratitud',
      ],
    };

    String timeOfDay;
    if (hour < 12) {
      timeOfDay = 'morning';
    } else if (hour < 19) {
      timeOfDay = 'afternoon';
    } else {
      timeOfDay = 'evening';
    }

    final messageList = messages[timeOfDay]!;
    return messageList[DateTime.now().day % messageList.length];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topHeight = size.height * 0.33;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Hero section - 33% superior
          SliverToBoxAdapter(
            child: Container(
              height: topHeight,
              alignment: Alignment.center,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _getMotivationalMessage(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 28,
                            fontWeight: FontWeight.w300,
                            color: AppColors.textPrimary,
                            height: 1.4,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Indicador sutil de scroll
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _fadeAnimation.value * 0.4,
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.textTertiary,
                                size: 32,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Contenido scrolleable
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSectionLabel('SESIONES DE COACHING'),
                const SizedBox(height: 16),
                _buildCoachingSection(context),
                
                const SizedBox(height: 48),
                
                _buildSectionLabel('PRÓXIMOS PASOS'),
                const SizedBox(height: 16),
                _buildNextStepsSection(context),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
        letterSpacing: 2.0,
      ),
    );
  }

  Widget _buildCoachingSection(BuildContext context) {
    final sessions = CoachingSession.mockSessions();
    final lastSession = sessions.isNotEmpty ? sessions.first : null;

    if (lastSession == null) {
      return _buildEmptyCoaching();
    }

    return _buildCoachingCard(context, lastSession);
  }

  Widget _buildEmptyCoaching() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(
          color: AppColors.surfaceSecondary,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.psychology_outlined,
            size: 48,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: 16),
          Text(
            'Tu primera sesión de coaching\nte espera',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoachingCard(BuildContext context, CoachingSession session) {
    final months = [
      'ene', 'feb', 'mar', 'abr', 'may', 'jun',
      'jul', 'ago', 'sep', 'oct', 'nov', 'dic'
    ];
    final dateStr = '${session.date.day} ${months[session.date.month - 1]} ${session.date.year}';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // TODO: Navegar a coaching
        },
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(
              color: AppColors.surfaceSecondary,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ÚLTIMA SESIÓN',
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                dateStr.toUpperCase(),
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                session.summary,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'VER DETALLES',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    size: 14,
                    color: AppColors.textPrimary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextStepsSection(BuildContext context) {
    return Column(
      children: [
        _buildActionCard(
          label: 'EXPLORAR',
          title: 'Retos disponibles',
          description: 'Ejercicios diseñados para tu crecimiento personal',
          onTap: () {
            // TODO: Navegar a retos
          },
        ),
        const SizedBox(height: 16),
        _buildActionCard(
          label: 'DESCUBRIR',
          title: 'Planes de coaching',
          description: 'Elige el camino que resuene con tu propósito',
          onTap: () {
            // TODO: Navegar a planes
          },
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required String label,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(
              color: AppColors.surfaceSecondary,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
