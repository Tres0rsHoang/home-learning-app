import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:donuts_app/core/network/api_client.dart';

class AuthRepositoryIml {
  final _api = ApiClient().dio;
  final _storage = const FlutterSecureStorage();

  Future<bool> login(String username, String password) async {
    try {
      final response = await _api.post(
        "${dotenv.env['API_URL']}/auth/login",
        data: {'username': username, 'password': password},
        options: Options(followRedirects: false, validateStatus: (_) => true),
      );
      if (response.statusCode == 200) {
        final accessToken = response.data['accessToken'];

        final cookies = response.headers.map['set-cookie'];
        final refreshToken = _extractCookie(cookies ?? [], 'refresh_token');

        if (accessToken != null && refreshToken != null) {
          await _storage.write(key: 'access_token', value: accessToken);
          await _storage.write(key: 'refresh_token', value: refreshToken);
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  String? _extractCookie(List<String> cookies, String key) {
    for (final cookie in cookies) {
      if (cookie.startsWith('$key=')) {
        return cookie.split(';').first.split('=').last;
      }
    }
    return null;
  }

  Future<bool> refresh() async {
    final String? refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) return false;
    try {
      _api.options.headers['Cookie'] = "refresh_token=$refreshToken";
      final response = await _api.post("${dotenv.env['API_URL']}/auth/refresh");
      if (response.statusCode == 201) {
        final accessToken = response.data['accessToken'];
        if (accessToken != null) {
          await _storage.write(key: 'access_token', value: accessToken);
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
