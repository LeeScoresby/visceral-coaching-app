/// Tipo de plan Visceral
enum PlanType {
  soul,
  body;

  String get displayName {
    switch (this) {
      case PlanType.soul:
        return 'Visceral SOUL';
      case PlanType.body:
        return 'Visceral BODY';
    }
  }

  String get emoji {
    switch (this) {
      case PlanType.soul:
        return '🔥';
      case PlanType.body:
        return '💚';
    }
  }
}

/// Estado de un plan
enum PlanStatus {
  notStarted,
  inProgress,
  completed;

  String get displayName {
    switch (this) {
      case PlanStatus.notStarted:
        return 'No iniciado';
      case PlanStatus.inProgress:
        return 'En progreso';
      case PlanStatus.completed:
        return 'Completado';
    }
  }
}

/// Modelo de datos para un plan Visceral
class VisceralPlan {
  final String id;
  final PlanType type;
  final String title;
  final String description;
  final int totalWeeks;
  final int currentWeek;
  final PlanStatus status;
  final bool isAvailable;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final List<String> milestones;
  final double progressPercentage;

  const VisceralPlan({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.totalWeeks,
    this.currentWeek = 0,
    this.status = PlanStatus.notStarted,
    this.isAvailable = true,
    this.startedAt,
    this.completedAt,
    this.milestones = const [],
    this.progressPercentage = 0.0,
  });

  /// Constructor desde JSON
  factory VisceralPlan.fromJson(Map<String, dynamic> json) {
    return VisceralPlan(
      id: json['id'] as String,
      type: PlanType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => PlanType.soul,
      ),
      title: json['title'] as String,
      description: json['description'] as String,
      totalWeeks: json['totalWeeks'] as int,
      currentWeek: json['currentWeek'] as int? ?? 0,
      status: PlanStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => PlanStatus.notStarted,
      ),
      isAvailable: json['isAvailable'] as bool? ?? true,
      startedAt: json['startedAt'] != null
          ? DateTime.parse(json['startedAt'] as String)
          : null,
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
      milestones: (json['milestones'] as List<dynamic>?)?.cast<String>() ?? [],
      progressPercentage: (json['progressPercentage'] as num?)?.toDouble() ?? 0.0,
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'title': title,
      'description': description,
      'totalWeeks': totalWeeks,
      'currentWeek': currentWeek,
      'status': status.name,
      'isAvailable': isAvailable,
      'startedAt': startedAt?.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'milestones': milestones,
      'progressPercentage': progressPercentage,
    };
  }

  /// Crear copia con campos actualizados
  VisceralPlan copyWith({
    PlanType? type,
    String? title,
    String? description,
    int? totalWeeks,
    int? currentWeek,
    PlanStatus? status,
    bool? isAvailable,
    DateTime? startedAt,
    DateTime? completedAt,
    List<String>? milestones,
    double? progressPercentage,
  }) {
    return VisceralPlan(
      id: id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      totalWeeks: totalWeeks ?? this.totalWeeks,
      currentWeek: currentWeek ?? this.currentWeek,
      status: status ?? this.status,
      isAvailable: isAvailable ?? this.isAvailable,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      milestones: milestones ?? this.milestones,
      progressPercentage: progressPercentage ?? this.progressPercentage,
    );
  }

  /// Planes disponibles
  static List<VisceralPlan> availablePlans() {
    return [
      const VisceralPlan(
        id: 'visceral-soul',
        type: PlanType.soul,
        title: 'Visceral SOUL',
        description: 'Conecta con tu esencia más profunda. Un viaje de 12 semanas para despertar tu consciencia visceral y transformar tu relación contigo mismo.',
        totalWeeks: 12,
        isAvailable: true,
        milestones: [
          'Semanas 1-4: Despertar la Consciencia',
          'Semanas 5-8: Integración Emocional',
          'Semanas 9-12: Transformación Profunda',
        ],
      ),
      const VisceralPlan(
        id: 'visceral-body',
        type: PlanType.body,
        title: 'Visceral BODY',
        description: 'Honra tu templo físico. Un programa holístico para fortalecer la conexión cuerpo-mente y cultivar vitalidad desde tu centro.',
        totalWeeks: 12,
        isAvailable: false, // Próximamente
        milestones: [
          'Semanas 1-4: Fundamentos Corporales',
          'Semanas 5-8: Movimiento Consciente',
          'Semanas 9-12: Vitalidad Integrada',
        ],
      ),
    ];
  }

  /// Plan demo para desarrollo
  static VisceralPlan demo() {
    return availablePlans().first;
  }
}
