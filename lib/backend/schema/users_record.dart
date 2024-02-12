import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "pincode" field.
  int? _pincode;
  int get pincode => _pincode ?? 0;
  bool hasPincode() => _pincode != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "keyword" field.
  List<String>? _keyword;
  List<String> get keyword => _keyword ?? const [];
  bool hasKeyword() => _keyword != null;

  // "branch_code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  bool hasBranchCode() => _branchCode != null;

  // "branch_area" field.
  String? _branchArea;
  String get branchArea => _branchArea ?? '';
  bool hasBranchArea() => _branchArea != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _address = snapshotData['address'] as String?;
    _pincode = castToType<int>(snapshotData['pincode']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _role = snapshotData['role'] as String?;
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _uid = snapshotData['uid'] as String?;
    _keyword = getDataList(snapshotData['keyword']);
    _branchCode = snapshotData['branch_code'] as String?;
    _branchArea = snapshotData['branch_area'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? address,
  int? pincode,
  String? phoneNumber,
  String? role,
  String? name,
  LatLng? location,
  String? uid,
  String? branchCode,
  String? branchArea,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'address': address,
      'pincode': pincode,
      'phone_number': phoneNumber,
      'role': role,
      'name': name,
      'location': location,
      'uid': uid,
      'branch_code': branchCode,
      'branch_area': branchArea,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.address == e2?.address &&
        e1?.pincode == e2?.pincode &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.role == e2?.role &&
        e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.keyword, e2?.keyword) &&
        e1?.branchCode == e2?.branchCode &&
        e1?.branchArea == e2?.branchArea;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.address,
        e?.pincode,
        e?.phoneNumber,
        e?.role,
        e?.name,
        e?.location,
        e?.uid,
        e?.keyword,
        e?.branchCode,
        e?.branchArea
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
