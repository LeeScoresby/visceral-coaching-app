/// Modelo de datos para el usuario
class User {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final DateTime createdAt;
  final bool hasMembership;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.createdAt,
    this.hasMembership = false,
  });

  /// Constructor para crear un usuario mock/demo
  factory User.demo() {
    return User(
      id: 'demo-user-123',
      name: 'Usuario Demo',
      email: 'demo@visceral.app',
      createdAt: DateTime.now(),
      hasMembership: false,
    );
  }

  /// Constructor desde JSON (para cuando uses Firebase)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      hasMembership: json['hasMembership'] as bool? ?? false,
    );
  }

  /// Convertir a JSON (para cuando uses Firebase)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'createdAt': createdAt.toIso8601String(),
      'hasMembership': hasMembership,
    };
  }

  /// Crear copia con campos actualizados
  User copyWith({
    String? name,
    String? email,
    String? photoUrl,
    bool? hasMembership,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt,
      hasMembership: hasMembership ?? this.hasMembership,
    );
  }
}
