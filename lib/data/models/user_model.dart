class User {
  final int id;
  final String name;
  final String email;
  final bool isFavorite;
  final bool isReported;
  final bool isSelected;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isFavorite,
    required this.isReported,
    required this.isSelected,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    bool? isFavorite,
    bool? isReported,
    bool? isSelected,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isFavorite: isFavorite ?? this.isFavorite,
      isReported: isReported ?? this.isReported,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isFavorite: json['isFavorite'] ?? false,
      isReported: json['isReported'] ?? false,
      isSelected: json['isSelected'] ?? false,
    );
  }
}
