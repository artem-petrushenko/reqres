import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_model.freezed.dart';
part 'users_model.g.dart';

@freezed
class UsersModel with _$UsersModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UsersModel({
    final int? page,
    final int? perPage,
    final int? total,
    final int? totalPages,
    required final List<User> data,
    final Support? support,
  }) = _UsersModel;

  factory UsersModel.fromJson(Map<String, dynamic> json) => _$UsersModelFromJson(json);
}

@freezed
class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory User({
    final int? id,
    final String? email,
    final String? firstName,
    final String? lastName,
    final String? avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Support with _$Support {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Support({
    final String? url,
    final String? text,
  }) = _Support;

  factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);
}
