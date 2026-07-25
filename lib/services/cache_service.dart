import 'package:shared_preferences/shared_preferences.dart';

/// Caches AI image-search results locally so repeated queries are instant.
///
/// Keys are formatted as `"search_${imageId}_${normalizedQuery}"`.
/// Cached values are `"yes"` or `"no"` — the raw AI response.
class CacheService {
  static const String _prefix = 'search_';

  SharedPreferences? _prefs;

  Future<void> _ensureInit() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  String _key(String imageId, String query) {
    final normalizedQuery = query.trim().toLowerCase();
    return '$_prefix${imageId}_$normalizedQuery';
  }

  /// Returns the cached result for [imageId] + [query], or `null` on a miss.
  Future<String?> get(String imageId, String query) async {
    await _ensureInit();
    return _prefs!.getString(_key(imageId, query));
  }

  /// Stores [result] (`"yes"` or `"no"`) for [imageId] + [query].
  Future<void> set(String imageId, String query, String result) async {
    await _ensureInit();
    await _prefs!.setString(_key(imageId, query), result);
  }

  /// Clears all cached search results. Useful for a "clear cache" settings action.
  Future<void> clearAll() async {
    await _ensureInit();
    final keys = _prefs!.getKeys().where((k) => k.startsWith(_prefix)).toList();
    for (final key in keys) {
      await _prefs!.remove(key);
    }
  }
}
