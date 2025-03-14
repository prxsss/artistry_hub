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
}
