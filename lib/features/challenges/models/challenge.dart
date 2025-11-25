/// Challenge type based on access
enum ChallengeType {
  free,
  premium;

  String get displayName {
    switch (this) {
      case ChallengeType.free:
        return 'Free';
      case ChallengeType.premium:
        return 'Premium';
    }
  }
  
  String get emoji {
    switch (this) {
      case ChallengeType.free:
        return '🌱';
      case ChallengeType.premium:
        return '✨';
    }
  }
}

/// Data model for a challenge
class Challenge {
  final String id;
  final String title;
  final String description;
  final ChallengeType type;
  final int durationMinutes;
  final String? imageUrl;
  final List<String> tags;
  final bool isCompleted;
  final bool isComingSoon;

  const Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.durationMinutes,
    this.imageUrl,
    this.tags = const [],
    this.isCompleted = false,
    this.isComingSoon = false,
  });

  /// Constructor from JSON
  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: ChallengeType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => ChallengeType.free,
      ),
      durationMinutes: json['durationMinutes'] as int,
      imageUrl: json['imageUrl'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
      isCompleted: json['isCompleted'] as bool? ?? false,
      isComingSoon: json['isComingSoon'] as bool? ?? false,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type.name,
      'durationMinutes': durationMinutes,
      'imageUrl': imageUrl,
      'tags': tags,
      'isCompleted': isCompleted,
      'isComingSoon': isComingSoon,
    };
  }

  /// Create a copy with updated fields
  Challenge copyWith({
    String? title,
    String? description,
    ChallengeType? type,
    int? durationMinutes,
    String? imageUrl,
    List<String>? tags,
    bool? isCompleted,
    bool? isComingSoon,
  }) {
    return Challenge(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
      isCompleted: isCompleted ?? this.isCompleted,
      isComingSoon: isComingSoon ?? this.isComingSoon,
    );
  }

  /// Mock data for development
  static List<Challenge> mockChallenges() {
    return [
      const Challenge(
        id: '1',
        title: 'Evalúa tus dominios vitales',
        description: 'Descubre cómo están tus diferentes áreas de vida: salud, relaciones, propósito y más. Un ejercicio fundamental para tu autoconocimiento.',
        type: ChallengeType.free,
        durationMinutes: 15,
        tags: ['autoconocimiento', 'vida'],
        isComingSoon: false,
      ),
      const Challenge(
        id: '2',
        title: 'Habla con tu niño interior',
        description: 'Un viaje profundo de sanación emocional. Conecta con tu esencia más pura y sana heridas del pasado.',
        type: ChallengeType.premium,
        durationMinutes: 25,
        tags: ['sanación', 'emocional'],
        isComingSoon: false,
      ),
      const Challenge(
        id: '3',
        title: 'Conoce tu arquetipo de Jung',
        description: 'Descubre qué arquetipo domina tu personalidad según la psicología profunda de Carl Jung.',
        type: ChallengeType.premium,
        durationMinutes: 20,
        tags: ['psicología', 'autoconocimiento'],
        isComingSoon: true,
      ),
      const Challenge(
        id: '4',
        title: 'Tu presente, pasado y futuro hablan',
        description: 'Un ejercicio de integración temporal. Escucha los mensajes de tus diferentes versiones y encuentra tu camino.',
        type: ChallengeType.free,
        durationMinutes: 30,
        tags: ['integración', 'tiempo'],
        isComingSoon: true,
      ),
    ];
  }
}
