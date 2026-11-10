/// Paths of the VibeZone REST API v1 (see `VibeZone.postman_collection.json`).
class ApiEndpoints {
  static const _v1 = '/api/v1';

  // Auth
  static const register = '$_v1/auth/register';
  static const verifyEmail = '$_v1/auth/verify-email';
  static const resendVerification = '$_v1/auth/resend-verification';
  static const token = '$_v1/auth/token';
  static const refreshToken = '$_v1/auth/token/refresh';
  static const revokeToken = '$_v1/auth/token/revoke';
  static const forgotPassword = '$_v1/auth/forgot-password';
  static const resetPassword = '$_v1/auth/reset-password';

  // Account
  static const me = '$_v1/me';
  static const myProfile = '$_v1/me/profile';
  static const myPassword = '$_v1/me/password';
  static const myAvatar = '$_v1/me/avatar';
  static const mySessions = '$_v1/me/sessions';
  static const revokeOtherSessions = '$_v1/me/sessions/revoke-others';
  static String mySession(String id) => '$_v1/me/sessions/$id';

  // Catalog
  static const genres = '$_v1/genres';
  static const tracks = '$_v1/tracks';
  static const trendingTracks = '$_v1/tracks/trending';
  static String track(String id) => '$_v1/tracks/$id';
  static String trackPlayback(String id) => '$_v1/tracks/$id/playback';
  static String trackWaveform(String id) => '$_v1/tracks/$id/waveform';
  static String artist(String slug) => '$_v1/artists/$slug';
  static const myArtist = '$_v1/me/artist';
  static const myTracks = '$_v1/me/tracks';

  // Media
  static const trackUploads = '$_v1/track-uploads';
  static String trackUpload(String id) => '$_v1/tracks/$id/upload';

  // Search
  static const search = '$_v1/search';
  static const searchTracks = '$_v1/search/tracks';
  static const searchArtists = '$_v1/search/artists';
  static const searchAlbums = '$_v1/search/albums';

  // Playlists
  static const playlists = '$_v1/playlists';
  static const myPlaylists = '$_v1/me/playlists';
  static String playlist(String id) => '$_v1/playlists/$id';
  static String playlistTracks(String id) => '$_v1/playlists/$id/tracks';
  static String playlistTrack(String id, String trackId) =>
      '$_v1/playlists/$id/tracks/$trackId';
}
