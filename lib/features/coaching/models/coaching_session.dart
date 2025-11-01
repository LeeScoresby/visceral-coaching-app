class CoachingSession {
  final String id;
  final DateTime date;
  final String summary;
  final String conclusions;

  const CoachingSession({
    required this.id,
    required this.date,
    required this.summary,
    required this.conclusions,
  });

  factory CoachingSession.fromJson(Map<String, dynamic> json) {
    return CoachingSession(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      summary: json['summary'] as String,
      conclusions: json['conclusions'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'summary': summary,
      'conclusions': conclusions,
    };
  }

  CoachingSession copyWith({
    String? id,
    DateTime? date,
    String? summary,
    String? conclusions,
  }) {
    return CoachingSession(
      id: id ?? this.id,
      date: date ?? this.date,
      summary: summary ?? this.summary,
      conclusions: conclusions ?? this.conclusions,
    );
  }

  static List<CoachingSession> mockSessions() {
    return [
      CoachingSession(
        id: 'session_001',
        date: DateTime(2024, 1, 15, 10, 0),
        summary: 'Exploración inicial de objetivos personales y valores fundamentales. Identificación de áreas de crecimiento.',
        conclusions: 'Compromiso de trabajar en equilibrio vida-trabajo. Definición de 3 objetivos principales para el trimestre.',
      ),
      CoachingSession(
        id: 'session_002',
        date: DateTime(2024, 1, 22, 10, 0),
        summary: 'Revisión del progreso en objetivos. Trabajo profundo sobre patrones limitantes en relaciones.',
        conclusions: 'Reconocimiento de patrones de evitación. Práctica diaria de comunicación asertiva como siguiente paso.',
      ),
      CoachingSession(
        id: 'session_003',
        date: DateTime(2024, 1, 29, 10, 0),
        summary: 'Exploración del arquetipo personal y su influencia en decisiones actuales. Conexión con propósito de vida.',
        conclusions: 'Mayor claridad sobre valores esenciales. Acción: diario de gratitud y reflexión semanal.',
      ),
    ];
  }
}
