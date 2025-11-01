import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = User.demo(); // TODO: Obtener del provider/Firebase

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'PERFIL',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            
            // Avatar
            _buildAvatar(user),
            const SizedBox(height: 32),

            // Datos personales
            _buildPersonalDataCard(context, user),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(User user) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 60,
        backgroundColor: AppColors.surfaceSecondary,
        child: user.photoUrl != null
            ? ClipOval(
                child: Image.network(
                  user.photoUrl!,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              )
            : Text(
                user.name.substring(0, 1).toUpperCase(),
                style: GoogleFonts.montserrat(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
      ),
    );
  }

  Widget _buildPersonalDataCard(BuildContext context, User user) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
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
            'INFORMACIÓN',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 24),
          
          _buildDataRow(
            label: 'NOMBRE',
            value: user.name,
          ),
          const SizedBox(height: 20),
          
          _buildDataRow(
            label: 'EMAIL',
            value: user.email,
          ),
          const SizedBox(height: 20),
          
          _buildDataRow(
            label: 'MIEMBRO DESDE',
            value: _formatDate(user.createdAt),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow({
    required String label,
    required String value,
  }) {
    return Column(
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
        const SizedBox(height: 6),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
      'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
