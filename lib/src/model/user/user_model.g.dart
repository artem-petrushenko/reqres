// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      data: json['data'] == null
          ? null
          : UserDetail.fromJson(json['data'] as Map<String, dynamic>),
      support: json['support'] == null
          ? null
          : Support.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'support': instance.support?.toJson(),
    };

_$_UserDetail _$$_UserDetailFromJson(Map<String, dynamic> json) =>
    _$_UserDetail(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$_UserDetailToJson(_$_UserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };

_$_Support _$$_SupportFromJson(Map<String, dynamic> json) => _$_Support(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$_SupportToJson(_$_Support instance) =>
    <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
