import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserModel({
    UserDetail? data,
    Support? support,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class UserDetail with _$UserDetail {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserDetail({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _UserDetail;

  factory UserDetail.fromJson(Map<String, dynamic> json) => _$UserDetailFromJson(json);
}

@freezed
class Support with _$Support {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Support({
    String? url,
    String? text,
  }) = _Support;

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);
}
