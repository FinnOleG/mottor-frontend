import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PostTemplatesRecord extends FirestoreRecord {
  PostTemplatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "background" field.
  String? _background;
  String get background => _background ?? '';
  bool hasBackground() => _background != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "selectedArea" field.
  String? _selectedArea;
  String get selectedArea => _selectedArea ?? '';
  bool hasSelectedArea() => _selectedArea != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "drivingInstruction" field.
  DocumentReference? _drivingInstruction;
  DocumentReference? get drivingInstruction => _drivingInstruction;
  bool hasDrivingInstruction() => _drivingInstruction != null;

  void _initializeFields() {
    _background = snapshotData['background'] as String?;
    _name = snapshotData['name'] as String?;
    _selectedArea = snapshotData['selectedArea'] as String?;
    _type = snapshotData['type'] as String?;
    _drivingInstruction =
        snapshotData['drivingInstruction'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('postTemplates');

  static Stream<PostTemplatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostTemplatesRecord.fromSnapshot(s));

  static Future<PostTemplatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostTemplatesRecord.fromSnapshot(s));

  static PostTemplatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostTemplatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostTemplatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostTemplatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostTemplatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostTemplatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostTemplatesRecordData({
  String? background,
  String? name,
  String? selectedArea,
  String? type,
  DocumentReference? drivingInstruction,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'background': background,
      'name': name,
      'selectedArea': selectedArea,
      'type': type,
      'drivingInstruction': drivingInstruction,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostTemplatesRecordDocumentEquality
    implements Equality<PostTemplatesRecord> {
  const PostTemplatesRecordDocumentEquality();

  @override
  bool equals(PostTemplatesRecord? e1, PostTemplatesRecord? e2) {
    return e1?.background == e2?.background &&
        e1?.name == e2?.name &&
        e1?.selectedArea == e2?.selectedArea &&
        e1?.type == e2?.type &&
        e1?.drivingInstruction == e2?.drivingInstruction;
  }

  @override
  int hash(PostTemplatesRecord? e) => const ListEquality().hash([
        e?.background,
        e?.name,
        e?.selectedArea,
        e?.type,
        e?.drivingInstruction
      ]);

  @override
  bool isValidKey(Object? o) => o is PostTemplatesRecord;
}
