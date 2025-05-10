import 'package:cosine/models/models.dart';

class School {
  final String id;
  final String name;
  final String stage;
  final String? email;
  final String? phone;
  final String? address;
  final String? activityStatus;
  final String? approvalStatus;
  final String? logo;
  final String? onboardingStage;
  final String? state;
  final String country;
  final String ownerId;
  final CosineUser? owner;

  School({
    required this.id,
    required this.name,
    required this.stage,
    required this.email,
    required this.address,
    required this.phone,
    required this.logo,
    required this.activityStatus,
    required this.approvalStatus,
    required this.onboardingStage,
    required this.state,
    required this.country,
    required this.ownerId,
    this.owner,
  });

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'] ?? '',
      name: json['name'],
      stage: json['stage'],
      email: json['email'],
      logo: json['logo'],
      phone: json['phone'],
      address: json['address'],
      activityStatus: json['activity_status'],
      approvalStatus: json['approval_status'],
      onboardingStage: json['onboarding_stage'],
      state: json['state'],
      country: json['country'],
      ownerId: json['owner_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'stage': stage,
      'email': email,
      'logo': logo,
      'phone': phone,
      'address': address,
      'activity_status': activityStatus,
      'approval_status': approvalStatus,
      'onboarding_stage': onboardingStage,
      'state': state,
      'country': country,
      'owner_id': ownerId,
    };
  }

  School copyWith({
    String? id,
    String? name,
    String? stage,
    String? email,
    String? logo,
    String? phone,
    String? address,
    String? activityStatus,
    String? approvalStatus,
    String? onboardingStage,
    String? state,
    String? country,
    String? ownerId,
    CosineUser? owner,
  }) {
    return School(
      id: id ?? this.id,
      name: name ?? this.name,
      stage: stage ?? this.stage,
      email: email ?? this.email,
      logo: logo ?? this.logo,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      activityStatus: activityStatus ?? this.activityStatus,
      approvalStatus: approvalStatus ?? this.approvalStatus,
      onboardingStage: onboardingStage ?? this.onboardingStage,
      state: state ?? this.state,
      country: country ?? this.country,
      ownerId: ownerId ?? this.ownerId,
      owner: owner ?? this.owner,
    );
  }

  /// Creates a copy of this profile with optional models
  /// This is useful when you want to update the user or school models
  /// without changing the other properties of the profile

  School injectModel(CosineUser? ower) {
    return copyWith(owner: owner);
  }

  /// Override toString for debugging
  @override
  String toString() {
    return 'School(id: $id, name: $name, stage: $stage, email: $email, logo: $logo, phone: $phone, address: $address, activityStatus: $activityStatus, approvalStatus: $approvalStatus, onboardingStage: $onboardingStage, state: $state, country: $country, ownerId: $ownerId)';
  }
}
