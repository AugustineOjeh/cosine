class CosineUser {
  final String id;
  final String? firstName;
  final String? lastName;
  final String email;
  final String? image;
  final String? phone;
  final String? bio;

  CosineUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.phone,
    required this.bio,
  });

  // Getter for full name
  String get fullName => '$firstName $lastName';

  factory CosineUser.fromJson(Map<String, dynamic> json) {
    return CosineUser(
      id: json['id'] ?? '',
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      image: json['image'],
      phone: json['phone'],
      bio: json['bio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'image': image,
      'bio': bio,
      'phone': phone,
    };
  }

  CosineUser copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? image,
    String? phone,
    String? bio,
  }) {
    return CosineUser(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      bio: bio ?? this.bio,
    );
  }

  /// Override toString for debugging
  @override
  String toString() {
    return 'CosineUser(id: $id, firstName: $firstName, lastName: $lastName, email: $email, fullName: $fullName, image: $image, phone: $phone, bio: $bio)';
  }
}
