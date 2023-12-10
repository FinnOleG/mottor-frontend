import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DrivingInstructionsRecord extends FirestoreRecord {
  DrivingInstructionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('drivingInstructions');

  static Stream<DrivingInstructionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrivingInstructionsRecord.fromSnapshot(s));

  static Future<DrivingInstructionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DrivingInstructionsRecord.fromSnapshot(s));

  static DrivingInstructionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DrivingInstructionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrivingInstructionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrivingInstructionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrivingInstructionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DrivingInstructionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDrivingInstructionsRecordData({
  String? name,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class DrivingInstructionsRecordDocumentEquality
    implements Equality<DrivingInstructionsRecord> {
  const DrivingInstructionsRecordDocumentEquality();

  @override
  bool equals(DrivingInstructionsRecord? e1, DrivingInstructionsRecord? e2) {
    return e1?.name == e2?.name && e1?.owner == e2?.owner;
  }

  @override
  int hash(DrivingInstructionsRecord? e) =>
      const ListEquality().hash([e?.name, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is DrivingInstructionsRecord;
}
