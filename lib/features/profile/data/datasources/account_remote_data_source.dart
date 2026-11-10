import 'dart:io';

import 'package:vibezone/core/network/api_client.dart';
import 'package:vibezone/core/network/api_endpoints.dart';
import 'package:vibezone/core/network/api_response.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';
import 'package:vibezone/features/profile/data/models/device_session_model.dart';

abstract class AccountRemoteDataSource {
  Future<UserModel> getMe();

  /// [locale] is `vi` or `en`.
  Future<void> updateProfile({
    required String displayName,
    required String locale,
  });

  /// Signs out every other session; this one stays valid.
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// JPEG/PNG/WebP, ≥ 200×200 px, ≤ 10 MB; the server crops it square.
  Future<void> setAvatar(File image);

  Future<void> removeAvatar();

  Future<List<DeviceSessionModel>> getSessions();

  Future<void> revokeSession(String id);

  /// Returns how many sessions were signed out.
  Future<int> revokeOtherSessions();
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  static const _sessionPageSize = 50;

  final ApiClient client;

  AccountRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> getMe() async {
    final response = await client.get(ApiEndpoints.me);
    return UserModel.fromJson(response.object);
  }

  @override
  Future<void> updateProfile({
    required String displayName,
    required String locale,
  }) async {
    await client.patch(
      ApiEndpoints.myProfile,
      data: {'displayName': displayName, 'locale': locale},
    );
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await client.post(
      ApiEndpoints.myPassword,
      data: {'currentPassword': currentPassword, 'newPassword': newPassword},
    );
  }

  @override
  Future<void> setAvatar(File image) async {
    await client.putImage(ApiEndpoints.myAvatar, image);
  }

  @override
  Future<void> removeAvatar() async {
    await client.delete(ApiEndpoints.myAvatar);
  }

  @override
  Future<List<DeviceSessionModel>> getSessions() async {
    final response = await client.get(
      ApiEndpoints.mySessions,
      query: {'page': 1, 'pageSize': _sessionPageSize},
    );
    return response.list(DeviceSessionModel.fromJson);
  }

  @override
  Future<void> revokeSession(String id) async {
    await client.delete(ApiEndpoints.mySession(id));
  }

  @override
  Future<int> revokeOtherSessions() async {
    final response = await client.post(ApiEndpoints.revokeOtherSessions);
    return asInt(response.object['revoked']) ?? 0;
  }
}
