import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PostOutlinesRecord extends FirestoreRecord {
  PostOutlinesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "studentName" field.
  String? _studentName;
  String get studentName => _studentName ?? '';
  bool hasStudentName() => _studentName != null;

  // "licenseClass" field.
  String? _licenseClass;
  String get licenseClass => _licenseClass ?? '';
  bool hasLicenseClass() => _licenseClass != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _studentName = snapshotData['studentName'] as String?;
    _licenseClass = snapshotData['licenseClass'] as String?;
    _type = snapshotData['type'] as String?;
    _author = snapshotData['author'] as DocumentReference?;
    _desc = snapshotData['desc'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('postOutlines');

  static Stream<PostOutlinesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostOutlinesRecord.fromSnapshot(s));

  static Future<PostOutlinesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostOutlinesRecord.fromSnapshot(s));

  static PostOutlinesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostOutlinesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostOutlinesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostOutlinesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostOutlinesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostOutlinesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostOutlinesRecordData({
  String? image,
  String? studentName,
  String? licenseClass,
  String? type,
  DocumentReference? author,
  String? desc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'studentName': studentName,
      'licenseClass': licenseClass,
      'type': type,
      'author': author,
      'desc': desc,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostOutlinesRecordDocumentEquality
    implements Equality<PostOutlinesRecord> {
  const PostOutlinesRecordDocumentEquality();

  @override
  bool equals(PostOutlinesRecord? e1, PostOutlinesRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.studentName == e2?.studentName &&
        e1?.licenseClass == e2?.licenseClass &&
        e1?.type == e2?.type &&
        e1?.author == e2?.author &&
        e1?.desc == e2?.desc;
  }

  @override
  int hash(PostOutlinesRecord? e) => const ListEquality().hash(
      [e?.image, e?.studentName, e?.licenseClass, e?.type, e?.author, e?.desc]);

  @override
  bool isValidKey(Object? o) => o is PostOutlinesRecord;
}
