import 'dart:convert';

import 'package:vibezone/core/storage/local_storage.dart';

abstract class SearchLocalDataSource {
  Future<List<String>> getRecentSearches();

  Future<void> cacheRecentSearches(List<String> searches);
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  static const _key = 'recent_searches';
  final LocalStorage storage;

  SearchLocalDataSourceImpl(this.storage);

  @override
  Future<List<String>> getRecentSearches() async {
    final raw = await storage.readValue(_key);
    if (raw == null || (raw as String).isEmpty) return [];
    return (jsonDecode(raw) as List).cast<String>();
  }

  @override
  Future<void> cacheRecentSearches(List<String> searches) =>
      storage.setValue(_key, jsonEncode(searches));
}
