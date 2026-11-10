// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  handle: json['handle'] as String,
  displayName: json['displayName'] as String,
  locale: json['locale'] as String? ?? 'vi',
  emailConfirmed: json['emailConfirmed'] as bool? ?? false,
  roles:
      (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  avatar: json['avatar'] == null
      ? null
      : ImageUrls.fromJson(json['avatar'] as Map<String, dynamic>),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'handle': instance.handle,
      'displayName': instance.displayName,
      'locale': instance.locale,
      'emailConfirmed': instance.emailConfirmed,
      'roles': instance.roles,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_ImageUrls _$ImageUrlsFromJson(Map<String, dynamic> json) =>
    _ImageUrls(small: json['small'] as String, large: json['large'] as String);

Map<String, dynamic> _$ImageUrlsToJson(_ImageUrls instance) =>
    <String, dynamic>{'small': instance.small, 'large': instance.large};
