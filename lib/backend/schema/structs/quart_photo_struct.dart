// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuartPhotoStruct extends BaseStruct {
  QuartPhotoStruct({
    String? photo,
    String? folderName,
  })  : _photo = photo,
        _folderName = folderName;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;
  bool hasPhoto() => _photo != null;

  // "folderName" field.
  String? _folderName;
  String get folderName => _folderName ?? '';
  set folderName(String? val) => _folderName = val;
  bool hasFolderName() => _folderName != null;

  static QuartPhotoStruct fromMap(Map<String, dynamic> data) =>
      QuartPhotoStruct(
        photo: data['photo'] as String?,
        folderName: data['folderName'] as String?,
      );

  static QuartPhotoStruct? maybeFromMap(dynamic data) => data is Map
      ? QuartPhotoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'photo': _photo,
        'folderName': _folderName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
        'folderName': serializeParam(
          _folderName,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuartPhotoStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuartPhotoStruct(
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        folderName: deserializeParam(
          data['folderName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuartPhotoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuartPhotoStruct &&
        photo == other.photo &&
        folderName == other.folderName;
  }

  @override
  int get hashCode => const ListEquality().hash([photo, folderName]);
}

QuartPhotoStruct createQuartPhotoStruct({
  String? photo,
  String? folderName,
}) =>
    QuartPhotoStruct(
      photo: photo,
      folderName: folderName,
    );
