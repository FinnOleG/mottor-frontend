import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  bool hasCaption() => _caption != null;

  // "plannedTimestamp" field.
  DateTime? _plannedTimestamp;
  DateTime? get plannedTimestamp => _plannedTimestamp;
  bool hasPlannedTimestamp() => _plannedTimestamp != null;

  // "createdTimestamp" field.
  DateTime? _createdTimestamp;
  DateTime? get createdTimestamp => _createdTimestamp;
  bool hasCreatedTimestamp() => _createdTimestamp != null;

  // "postedTimestamp" field.
  DateTime? _postedTimestamp;
  DateTime? get postedTimestamp => _postedTimestamp;
  bool hasPostedTimestamp() => _postedTimestamp != null;

  // "hashtags" field.
  List<String>? _hashtags;
  List<String> get hashtags => _hashtags ?? const [];
  bool hasHashtags() => _hashtags != null;

  // "resAdmin" field.
  DocumentReference? _resAdmin;
  DocumentReference? get resAdmin => _resAdmin;
  bool hasResAdmin() => _resAdmin != null;

  // "outlineId" field.
  DocumentReference? _outlineId;
  DocumentReference? get outlineId => _outlineId;
  bool hasOutlineId() => _outlineId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _caption = snapshotData['caption'] as String?;
    _plannedTimestamp = snapshotData['plannedTimestamp'] as DateTime?;
    _createdTimestamp = snapshotData['createdTimestamp'] as DateTime?;
    _postedTimestamp = snapshotData['postedTimestamp'] as DateTime?;
    _hashtags = getDataList(snapshotData['hashtags']);
    _resAdmin = snapshotData['resAdmin'] as DocumentReference?;
    _outlineId = snapshotData['outlineId'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? caption,
  DateTime? plannedTimestamp,
  DateTime? createdTimestamp,
  DateTime? postedTimestamp,
  DocumentReference? resAdmin,
  DocumentReference? outlineId,
  String? status,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'caption': caption,
      'plannedTimestamp': plannedTimestamp,
      'createdTimestamp': createdTimestamp,
      'postedTimestamp': postedTimestamp,
      'resAdmin': resAdmin,
      'outlineId': outlineId,
      'status': status,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.caption == e2?.caption &&
        e1?.plannedTimestamp == e2?.plannedTimestamp &&
        e1?.createdTimestamp == e2?.createdTimestamp &&
        e1?.postedTimestamp == e2?.postedTimestamp &&
        listEquality.equals(e1?.hashtags, e2?.hashtags) &&
        e1?.resAdmin == e2?.resAdmin &&
        e1?.outlineId == e2?.outlineId &&
        e1?.status == e2?.status &&
        e1?.type == e2?.type;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.caption,
        e?.plannedTimestamp,
        e?.createdTimestamp,
        e?.postedTimestamp,
        e?.hashtags,
        e?.resAdmin,
        e?.outlineId,
        e?.status,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
