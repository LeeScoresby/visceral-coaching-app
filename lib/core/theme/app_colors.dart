import 'package:flutter/material.dart';

/// Application colors - Spiritual and elegant palette
class AppColors {
  AppColors._();

  // Visceral Plans
  static const Color visceralSoul = Color(0xFFA0544A); // Visceral SOUL
  static const Color visceralBody = Color(0xFF9BA480); // Visceral BODY
  
  // Primary colors
  static const Color primary = visceralSoul; // SOUL as primary
  static const Color secondary = visceralBody; // BODY as secondary
  static const Color accent = Color(0xFFD4A574); // Soft gold
  
  // Backgrounds and surfaces
  static const Color background = Color(0xFFFAF9F7); // Soft cream
  static const Color surface = Color(0xFFFFFFFD); // Warm white
  static const Color surfaceSecondary = Color(0xFFF5F3F0); // Very light beige
  
  // Texts
  static const Color textPrimary = Color(0xFF333333); // Dark gray
  static const Color textSecondary = Color(0xFF8F8F8F);
  static const Color textTertiary = Color(0xFFB8B8B8);
  
  // States
  static const Color success = Color(0xFF9BA480); // BODY green
  static const Color warning = Color(0xFFE8C77C); // Soft amber
  static const Color error = Color(0xFFD89090); // Dusty pink
  
  // Challenge types
  static const Color premium = Color(0xFFD4A574); // Gold for premium
  static const Color free = Color(0xFF7DB89A); // Jade green for free
}
