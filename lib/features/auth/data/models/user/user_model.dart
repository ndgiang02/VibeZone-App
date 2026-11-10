// user_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/network/api_config.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// The signed-in account (`GET /api/v1/me`).
@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String email,
    required String handle,
    required String displayName,
    @Default('vi') String locale,
    @Default(false) bool emailConfirmed,
    @Default(<String>[]) List<String> roles,
    ImageUrls? avatar,

    /// Not returned by the API yet.
    DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.empty() =>
      const UserModel(id: '', email: '', handle: '', displayName: '');

  String get username => displayName.isNotEmpty ? displayName : handle;

  String? get avatarUrl =>
      avatar == null ? null : ApiConfig.resolveUrl(avatar!.large);

  bool get isArtist => roles.contains('Artist');
}

/// `{small, large}` image renditions; URLs are relative to the API base URL.
@freezed
abstract class ImageUrls with _$ImageUrls {
  const factory ImageUrls({required String small, required String large}) =
      _ImageUrls;

  factory ImageUrls.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlsFromJson(json);
}
