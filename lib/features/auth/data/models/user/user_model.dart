// user_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String username,
    required String email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? bio,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.empty() => UserModel(
    id: 0,
    username: '',
    email: '',
    createdAt: DateTime.fromMillisecondsSinceEpoch(0),
  );
}
