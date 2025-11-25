import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../models/challenge.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  Future<void> _showPaywall(BuildContext context) async {
    try {
      await RevenueCatUI.presentPaywall();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Error showing plans'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final challenges = Challenge.mockChallenges();

    return Scaffold(
      backgroundColor: AppColors.background,
        appBar: AppBar(
        title: Text(
          'CHALLENGES',
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          return _buildChallengeCard(context, challenges[index]);
        },
      ),
    );
  }

  Widget _buildChallengeCard(BuildContext context, Challenge challenge) {
    final isPremium = challenge.type == ChallengeType.premium;
    final canTap = !challenge.isComingSoon;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(
          color: AppColors.surfaceSecondary,
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: canTap
              ? () {
                  if (isPremium) {
                    _showPaywall(context);
                  } else {
                    // TODO: Navigate to challenge details
                  }
                }
              : null,
          child: Opacity(
            opacity: challenge.isComingSoon ? 0.5 : 1.0,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (challenge.isComingSoon)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
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
                  Text(
                    challenge.title,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    challenge.description,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (!challenge.isComingSoon) ...[
                    const SizedBox(height: 16),
                    Text(
                      '${challenge.durationMinutes} MIN',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                        letterSpacing: 2.0,
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
