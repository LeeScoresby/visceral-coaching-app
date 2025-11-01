import 'package:flutter/material.dart';

/// Colores de la aplicación - Paleta espiritual y elegante
class AppColors {
  AppColors._();

  // Planes Visceral
  static const Color visceralSoul = Color(0xFFA0544A); // Visceral SOUL
  static const Color visceralBody = Color(0xFF9BA480); // Visceral BODY
  
  // Colores principales
  static const Color primary = visceralSoul; // SOUL como primario
  static const Color secondary = visceralBody; // BODY como secundario
  static const Color accent = Color(0xFFD4A574); // Dorado suave
  
  // Fondos y superficies
  static const Color background = Color(0xFFFAF9F7); // Crema suave
  static const Color surface = Color(0xFFFFFFFD); // Blanco cálido
  static const Color surfaceSecondary = Color(0xFFF5F3F0); // Beige muy claro
  
  // Textos
  static const Color textPrimary = Color(0xFF333333); // Gris oscuro
  static const Color textSecondary = Color(0xFF8F8F8F);
  static const Color textTertiary = Color(0xFFB8B8B8);
  
  // Estados
  static const Color success = Color(0xFF9BA480); // Verde BODY
  static const Color warning = Color(0xFFE8C77C); // Ámbar suave
  static const Color error = Color(0xFFD89090); // Rosa empolvado
  
  // Tipos de retos
  static const Color premium = Color(0xFFD4A574); // Dorado para premium
  static const Color free = Color(0xFF7DB89A); // Verde jade para free
}
