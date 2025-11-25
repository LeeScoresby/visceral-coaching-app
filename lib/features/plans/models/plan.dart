/// Visceral plan type
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

/// Plan status
enum PlanStatus {
  notStarted,
  inProgress,
  completed;

  String get displayName {
    switch (this) {
      case PlanStatus.notStarted:
        return 'Not started';
      case PlanStatus.inProgress:
        return 'In progress';
      case PlanStatus.completed:
        return 'Completed';
    }
  }
}

/// Data model for a Visceral plan
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

  /// Constructor from JSON
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

  /// Convert to JSON
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

  /// Create a copy with updated fields
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

  /// Available plans
  static List<VisceralPlan> availablePlans() {
    return [
      const VisceralPlan(
        id: 'visceral-soul',
        type: PlanType.soul,
        title: 'Visceral SOUL',
        description: 'Connect with your deepest essence. A 12-week journey to awaken your visceral consciousness and transform your relationship with yourself.',
        totalWeeks: 12,
        isAvailable: true,
        milestones: [
          'Weeks 1-4: Awakening Consciousness',
          'Weeks 5-8: Emotional Integration',
          'Weeks 9-12: Deep Transformation',
        ],
      ),
      const VisceralPlan(
        id: 'visceral-body',
        type: PlanType.body,
        title: 'Visceral BODY',
        description: 'Honor your physical temple. A holistic program to strengthen the mind-body connection and cultivate vitality from your core.',
        totalWeeks: 12,
        isAvailable: false, // Coming soon
        milestones: [
          'Weeks 1-4: Corporeal Foundations',
          'Weeks 5-8: Conscious Movement',
          'Weeks 9-12: Integrated Vitality',
        ],
      ),
    ];
  }

  /// Demo plan for development
  static VisceralPlan demo() {
    return availablePlans().first;
  }
}
