import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../models/plan.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  List<VisceralPlan> _userPlans = []; // User active plans
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserPlans();
  }

  Future<void> _loadUserPlans() async {
    // TODO: Load active user plans from Firebase
    // For now we simulate that the user has no plans
    setState(() {
      _userPlans = [];
      _isLoading = false;
    });
  }

  Future<void> _showPaywall() async {
    try {
      await RevenueCatUI.presentPaywall();
      
      // Reload plans after paywall
      await _loadUserPlans();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error showing plans'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'PLANS',
          style: GoogleFonts.montserrat(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: _userPlans.isEmpty
          ? _buildPlanSelection()
          : _buildActivePlans(),
    );
  }

  Widget _buildActivePlans() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Active Plans',
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Continue your transformation journey',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          ..._userPlans.map((plan) => _buildActivePlanCard(plan)),
        ],
      ),
    );
  }

  Widget _buildActivePlanCard(VisceralPlan plan) {
    final planColor = plan.type == PlanType.soul
        ? AppColors.visceralSoul
        : AppColors.visceralBody;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            planColor,
            planColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: planColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Navigate to plan details
          },
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      plan.type.emoji,
                      style: const TextStyle(fontSize: 32),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        plan.type.displayName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  plan.description,
                  style: GoogleFonts.inter(
                    color: Colors.white.withOpacity(0.95),
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                _buildProgressIndicator(plan),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Continue plan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: planColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: const RoundedRectangleBorder(),
                      elevation: 0,
                    ),
                    child: Text(
                      plan.status == PlanStatus.notStarted
                          ? 'START JOURNEY'
                          : 'CONTINUE',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(VisceralPlan plan) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SEMANA ${plan.currentWeek} DE ${plan.totalWeeks}',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              '${(plan.progressPercentage * 100).toInt()}%',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 4,
          child: LinearProgressIndicator(
            value: plan.progressPercentage,
            backgroundColor: Colors.white.withOpacity(0.25),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildPlanSelection() {
    final availablePlans = VisceralPlan.availablePlans();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Your Path',
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Begin your visceral transformation',
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          ...availablePlans.map((plan) => _buildPlanCard(plan)),
        ],
      ),
    );
  }

  Widget _buildPlanCard(VisceralPlan plan) {
    final planColor = plan.type == PlanType.soul
        ? AppColors.visceralSoul
        : AppColors.visceralBody;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(
          color: planColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: plan.isAvailable
              ? () => _showPaywall()
              : null,
          child: Opacity(
            opacity: plan.isAvailable ? 1.0 : 0.6,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: planColor.withOpacity(0.15),
                        ),
                        child: Text(
                          plan.type.emoji,
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plan.type.displayName,
                              style: GoogleFonts.montserrat(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: planColor,
                                height: 1.2,
                              ),
                            ),
                            if (!plan.isAvailable) ...[
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.textTertiary.withOpacity(0.15),
                                ),
                                child: Text(
                                  'COMING SOON',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSecondary,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    plan.description,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${plan.totalWeeks} WEEK JOURNEY',
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...plan.milestones.map(
                    (milestone) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: planColor.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              milestone,
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (plan.isAvailable) ...[
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _showPaywall,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: planColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: const RoundedRectangleBorder(),
                          elevation: 0,
                        ),
                        child: Text(
                          'START NOW',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
