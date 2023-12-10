import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ImageRecord extends FirestoreRecord {
  ImageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "isNet_mask" field.
  String? _isNetMask;
  String get isNetMask => _isNetMask ?? '';
  bool hasIsNetMask() => _isNetMask != null;

  // "u2_mask" field.
  String? _u2Mask;
  String get u2Mask => _u2Mask ?? '';
  bool hasU2Mask() => _u2Mask != null;

  // "isNet_image" field.
  String? _isNetImage;
  String get isNetImage => _isNetImage ?? '';
  bool hasIsNetImage() => _isNetImage != null;

  // "u2_image" field.
  String? _u2Image;
  String get u2Image => _u2Image ?? '';
  bool hasU2Image() => _u2Image != null;

  // "u2_isNet_mask" field.
  String? _u2IsNetMask;
  String get u2IsNetMask => _u2IsNetMask ?? '';
  bool hasU2IsNetMask() => _u2IsNetMask != null;

  // "u2_isNet_image" field.
  String? _u2IsNetImage;
  String get u2IsNetImage => _u2IsNetImage ?? '';
  bool hasU2IsNetImage() => _u2IsNetImage != null;

  // "method_used" field.
  String? _methodUsed;
  String get methodUsed => _methodUsed ?? '';
  bool hasMethodUsed() => _methodUsed != null;

  // "final_image" field.
  String? _finalImage;
  String get finalImage => _finalImage ?? '';
  bool hasFinalImage() => _finalImage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isNetMask = snapshotData['isNet_mask'] as String?;
    _u2Mask = snapshotData['u2_mask'] as String?;
    _isNetImage = snapshotData['isNet_image'] as String?;
    _u2Image = snapshotData['u2_image'] as String?;
    _u2IsNetMask = snapshotData['u2_isNet_mask'] as String?;
    _u2IsNetImage = snapshotData['u2_isNet_image'] as String?;
    _methodUsed = snapshotData['method_used'] as String?;
    _finalImage = snapshotData['final_image'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('image')
          : FirebaseFirestore.instance.collectionGroup('image');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('image').doc();

  static Stream<ImageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImageRecord.fromSnapshot(s));

  static Future<ImageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImageRecord.fromSnapshot(s));

  static ImageRecord fromSnapshot(DocumentSnapshot snapshot) => ImageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImageRecordData({
  String? isNetMask,
  String? u2Mask,
  String? isNetImage,
  String? u2Image,
  String? u2IsNetMask,
  String? u2IsNetImage,
  String? methodUsed,
  String? finalImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isNet_mask': isNetMask,
      'u2_mask': u2Mask,
      'isNet_image': isNetImage,
      'u2_image': u2Image,
      'u2_isNet_mask': u2IsNetMask,
      'u2_isNet_image': u2IsNetImage,
      'method_used': methodUsed,
      'final_image': finalImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImageRecordDocumentEquality implements Equality<ImageRecord> {
  const ImageRecordDocumentEquality();

  @override
  bool equals(ImageRecord? e1, ImageRecord? e2) {
    return e1?.isNetMask == e2?.isNetMask &&
        e1?.u2Mask == e2?.u2Mask &&
        e1?.isNetImage == e2?.isNetImage &&
        e1?.u2Image == e2?.u2Image &&
        e1?.u2IsNetMask == e2?.u2IsNetMask &&
        e1?.u2IsNetImage == e2?.u2IsNetImage &&
        e1?.methodUsed == e2?.methodUsed &&
        e1?.finalImage == e2?.finalImage;
  }

  @override
  int hash(ImageRecord? e) => const ListEquality().hash([
        e?.isNetMask,
        e?.u2Mask,
        e?.isNetImage,
        e?.u2Image,
        e?.u2IsNetMask,
        e?.u2IsNetImage,
        e?.methodUsed,
        e?.finalImage
      ]);

  @override
  bool isValidKey(Object? o) => o is ImageRecord;
}
