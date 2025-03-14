import 'package:artistry_hub/enums/gender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Artist {
  final String name;
  final Gender gender;
  final String image;
  final String nationality;
  final String outstandingAchievement;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Artist({
    required this.name,
    required this.gender,
    required this.image,
    required this.nationality,
    required this.outstandingAchievement,
    required this.createdAt,
    required this.updatedAt,
  });

  Artist.fromJson(Map<String, Object?> json)
    : this(
        name: json['name']! as String,
        gender: Gender.values.firstWhere(
          (e) => e.toString().split('.').last == json['gender'] as String,
        ),
        image: json['image']! as String,
        nationality: json['nationality']! as String,
        outstandingAchievement: json['outstandingAchievement']! as String,
        createdAt: json['createdAt']! as Timestamp,
        updatedAt: json['updatedAt']! as Timestamp,
      );

  Artist copyWith({
    String? name,
    Gender? gender,
    String? image,
    String? nationality,
    String? outstandingAchievement,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return Artist(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      nationality: nationality ?? this.nationality,
      outstandingAchievement:
          outstandingAchievement ?? this.outstandingAchievement,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, Object?> toJson() {
    Map<String, Object?> json = {
      'name': name,
      'gender': gender.name,
      'image': image,
      'nationality': nationality,
      'outstandingAchievement': outstandingAchievement,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };

    print(json);

    return json;
  }
}
