import 'package:artistry_hub/models/artist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const kArtistCollection = 'artists';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _artistsRef;

  DatabaseService() {
    _artistsRef = _firestore
        .collection(kArtistCollection)
        .withConverter<Artist>(
          fromFirestore: (snapshots, _) => Artist.fromJson(snapshots.data()!),
          toFirestore: (artist, _) => artist.toJson(),
        );
  }

  Stream<QuerySnapshot> getArtists() {
    return _artistsRef.snapshots();
  }
}
