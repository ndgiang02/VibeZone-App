import 'package:vibezone/core/network/api_client.dart';
import 'package:vibezone/core/network/api_config.dart';
import 'package:vibezone/core/network/api_endpoints.dart';

abstract class PlayerRemoteDataSource {
  /// Absolute URL to hand to the audio player. It carries its own token
  /// (valid ~6 h), so the player needs no auth headers.
  Future<String> getStreamUrl(String trackId);

  /// Loudness peaks of the track's audio (~1000 values in 0..1).
  Future<List<double>> getWaveform(String trackId);
}

class PlayerRemoteDataSourceImpl implements PlayerRemoteDataSource {
  final ApiClient client;

  PlayerRemoteDataSourceImpl(this.client);

  @override
  Future<String> getStreamUrl(String trackId) async {
    final response = await client.get(ApiEndpoints.trackPlayback(trackId));
    return ApiConfig.resolveUrl(response.object['streamUrl'] as String);
  }

  @override
  Future<List<double>> getWaveform(String trackId) async {
    final response = await client.get(ApiEndpoints.trackWaveform(trackId));
    final peaks = response.object['peaks'] as List? ?? const [];
    return peaks.map((p) => (p as num).toDouble().clamp(0.0, 1.0)).toList();
  }
}
