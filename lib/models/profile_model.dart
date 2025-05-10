import 'package:cosine/models/models.dart';

class Profile {
  final String id;
  final String schoolId;
  final String userId;
  final String role;
  final String? studentId;
  final String? classroomId;
  final String? subjectId;
  final CosineUser? user;
  final School? school;
  // final Student? student;
  // final Classroom? classroom;
  // final Subject? subject;

  Profile({
    required this.id,
    required this.role,
    required this.subjectId,
    required this.studentId,
    required this.schoolId,
    required this.classroomId,
    required this.userId,
    this.user,
    this.school,
    // this.student,
    // this.classroom,
    // this.subject,
  });

  /// Creates a SchoolProfile from JSON
  /// This is useful when you want to create a profile from a JSON response
  /// from the server or a local file
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      schoolId: json['school_id'],
      userId: json['user_id'],
      role: json['role'],
      subjectId: json['subject_id'],
      classroomId: json['classroom_id'],
      studentId: json['student_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school_id': schoolId,
      'user_id': userId,
      'role': role,
      'subject_id': subjectId,
      'classroom_id': classroomId,
      'student_id': studentId,
    };
  }

  /// Creates a copy of this profile with optional overrides
  /// This is useful when you want to update the profile
  /// without changing the original instance
  Profile copyWith({
    String? id,
    String? schoolId,
    String? userId,
    String? role,
    String? studentId,
    String? classroomId,
    String? subjectId,
    CosineUser? user,
    School? school,
  }) {
    return Profile(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      studentId: studentId ?? this.studentId,
      classroomId: classroomId ?? this.classroomId,
      subjectId: subjectId ?? this.subjectId,
      user: user ?? this.user,
      school: school ?? this.school,
    );
  }

  /// Creates a copy of this profile with optional models
  /// This is useful when you want to update the user or school models
  /// without changing the other properties of the profile

  Profile injectModel({CosineUser? user, School? school}) {
    return copyWith(
      user: user,
      school: school,
    );
  }

  /// Override toString for debugging
  @override
  String toString() {
    return 'SchoolProfile(id: $id, schoolId: $schoolId, userId: $userId, role: $role, studentId: $studentId, classroomId: $classroomId, subjectId: $subjectId)';
  }
}
